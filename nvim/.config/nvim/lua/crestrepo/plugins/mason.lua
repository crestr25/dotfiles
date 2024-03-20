return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local servers = {
			"lua_ls",
			"pyright",
			"bashls",
			"gopls",
			"jsonls",
		}

		require("mason").setup({})

		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})
	end,
}
