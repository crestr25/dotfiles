return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				ensure_installed = {
					"bash",
					"go",
					"help",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
				ignore_install = { "help", "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
				autopairs = {
					enable = true,
				},
				highlight = {
					enable = true, -- false will disable the whole extension
					-- disable = { "scss", "css" }, -- list of language that will be disabled
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = { "yaml", "python", "html" } },
				context_commentstring = {
					enable = true,
				},
				autotag = {
					enable = true,
					disable = { "xml", "markdown" },
				},
			})
		end,
	},
}
