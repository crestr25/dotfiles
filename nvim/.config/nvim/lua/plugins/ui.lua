return {
	{
		"cpea2506/one_monokai.nvim",
		config = function()
            require("lualine").setup {
                options = {
                theme = "one_monokai"
              }
            }
           vim.cmd.colorscheme "one_monokai"
    	end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("plugins.config.neo-tree")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			local function fg(name)
				return function()
					---@type {foreground?:number}?
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								hint = " ",
								info = " ",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
						-- stylua: ignore
					},
					lualine_x = {
            -- stylua: ignore
            -- stylua: ignore
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
						{
							"diff",
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {},
				},
				extensions = { "neo-tree" },
			}
		end,
	},
	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			-- char = "▏",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			use_treesitter = true,
			show_current_context = true,
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "BufWinEnter",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = {
						Error = " ",
						Warn = " ",
					}
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
}
