-- ============================================================================
-- LSP Keymaps (set on attach)
-- ============================================================================

local function setup_keymaps(bufnr)
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, silent = true })
	end

	-- Navigation
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	map("n", "gr", vim.lsp.buf.references, "Go to references")
	map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

	-- Information
	map("n", "K", vim.lsp.buf.hover, "Hover documentation")
	map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
	map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

	-- Code actions
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, "Format buffer")

	-- Diagnostics
	map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
	map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
	map("n", "<leader>cl", vim.diagnostic.setloclist, "Diagnostics to loclist")

	-- Workspace
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "List workspace folders")
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		-- Setup keymaps for this buffer
		setup_keymaps(bufnr)
	end,
})

vim.lsp.enable({
	"lua-ls",
	"gopls",
	"pyright",
})

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
