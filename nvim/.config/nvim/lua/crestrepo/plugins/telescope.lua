return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ThePrimeagen/git-worktree.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local icons = require("crestrepo.utils.icons")

		telescope.load_extension("git_worktree")
		telescope.setup({
			defaults = {
				prompt_prefix = icons.ui.Telescope .. " ",
				selection_caret = icons.ui.Forward .. " ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				path_display = { "smart" },
				color_devicons = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},

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
			pickers = {
				live_grep = {
					theme = "dropdown",
				},

				grep_string = {
					theme = "dropdown",
				},

				find_files = {
					theme = "dropdown",
					previewer = false,
				},

				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},

				planets = {
					show_pluto = true,
					show_moon = true,
				},

				colorscheme = {
					enable_preview = true,
				},

				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

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
				w = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "List Worktrees" },
				W = {
					"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
					"Create Worktrees",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
