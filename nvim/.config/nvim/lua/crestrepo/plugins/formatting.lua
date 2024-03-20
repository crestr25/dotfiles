return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- local completion = null_ls.builtins.completion

		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.black,
				formatting.isort,
				diagnostics.flake8.with({
                    extra_args = { "--max-line-length", "140" }
                }),
				-- completion.spell,
			},
		})
	end,
}
