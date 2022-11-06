local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

local options = {
	ensure_installed = {
		"python",
		"lua",
		"vim",
		"c",
		"dockerfile",
		"go",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},
	incremental_selection = { enable = true },
}

treesitter.setup(options)
