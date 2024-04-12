return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local icons = require("crestrepo.utils.icons")

		telescope.setup({
			defaults = {
				prompt_prefix = icons.ui.Telescope .. " ",
				selection_caret = icons.ui.Forward .. " ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
		})

        telescope.load_extension("fzf")

		-- -- set which-key keymaps
		local wk = require("which-key")

		wk.register({
			f = {
				name = "Telescope",
				b = { "<cmd>Telescope buffers previewer=false<CR>", "Buffers Preview" },
				g = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
				c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
				f = { "<cmd>Telescope find_files<CR>", "Find Files" },
				s = { "<cmd>Telescope live_grep<CR>", "Find Text" },
				h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
				l = { "<cmd>Telescope resume<CR>", "Last Search" },
				r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
			},
		}, { prefix = "<leader>" })
	end,
}
