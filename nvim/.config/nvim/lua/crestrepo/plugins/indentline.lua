return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
	config = function()
		require("indent_blankline").setup({
			buftype_exclude = { "terminal", "nofile" },
			filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"lazy",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"text",
			},
			show_trailing_blankline_indent = false,
			show_first_indent_level = true,
			use_treesitter = true,
			show_current_context = true,
		})
	end,
}
