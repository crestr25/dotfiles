return {
	{
		"nvim-telescope/telescope.nvim",
        config = function () require("plugins.config.telescope") end,
	},
	{
		"folke/which-key.nvim",
        config = function () require("plugins.config.whichkey") end,
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},

	-- Tmux
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
		end,
		keys = {
			{ "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", desc = "tmux move bottom" },
			{ "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", desc = "tmux move up" },
			{ "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", desc = "tmux move left" },
			{ "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", desc = "tmux move right" },
		},
	},
}
