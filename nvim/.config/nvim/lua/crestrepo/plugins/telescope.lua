return {
	"nvim-telescope/telescope.nvim",
    event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		-- -- set which-key keymaps
		local wk = require("which-key")

		wk.register({
			f = {
				name = "Telescope",
				space = { "<cmd>Telescope buffers<CR>", "Buffers Preview" },
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
