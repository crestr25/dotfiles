return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
		},
	},

	config = function()
		local lspconfig = require("lspconfig")
		local icons = require("crestrepo.utils.icons")

		local servers = {
			"lua_ls",
			"pyright",
			"bashls",
			"jsonls",
			"gopls",
			"yamlls",
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		local function common_capabilities()
			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			return capabilities
		end

		-- diagnostics default config
		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
					{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
					{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
					{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
				},
			},
			virtual_text = true,
			update_in_insert = false,
			underline = false,
			severity_sort = true,
			float = {
				focusable = true,
				-- style = "minimal",
				border = "rounded",
				source = "always",
			},
		}
		vim.diagnostic.config(default_diagnostic_config)

		-- Setup icons for diagnostics
		for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		for _, server in pairs(servers) do
			local opts = {
				capabilities = common_capabilities(),
			}
			-- Verify if there are extra settings for the server
			local require_ok, settings = pcall(require, "crestrepo.plugins.lsp_servers." .. server)

			if require_ok then
				opts = vim.tbl_deep_extend("force", settings, opts)
			end

			if server == "lua_ls" then
				require("neodev").setup({})
			end
			lspconfig[server].setup(opts)
		end

		-- set which-key keymaps
		local wk = require("which-key")

		wk.register({
			l = {
				name = "LSP-Actions",
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
				f = { "<cmd>lua vim.lsp.buf.format({async = true })<CR>", "Format Buffer" },
				i = { "<cmd>LspInfo<CR>", "LSP info" },
				j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
				k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
				l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "QuickFix" },
				r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Buffer" },
			},
		}, { prefix = "<leader>" })
	end,
}
