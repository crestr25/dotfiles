return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin
			require("nvim-treesitter.install").prefer_git = true

			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				-- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- Automatically install missing parsers when entering buffer
				auto_install = true,
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- enable indentation
				indent = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
                    "c",
					"json",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"luadoc",
					"vim",
					"vimdoc",
					"dockerfile",
					"gitignore",
					"query",
					"python",
				},
			})
		end,
	},
}
