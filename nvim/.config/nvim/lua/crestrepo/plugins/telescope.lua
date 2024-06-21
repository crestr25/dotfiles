return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				fzf = {},
				wrap_results = true,
			},
		})

		pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
