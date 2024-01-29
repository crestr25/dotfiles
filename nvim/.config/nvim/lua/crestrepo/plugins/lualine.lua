return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				ignore_focus = { "NvimTree" },
			},
			extensions = { "quickfix", "man", "fugitive" },
		})
	end,
}
