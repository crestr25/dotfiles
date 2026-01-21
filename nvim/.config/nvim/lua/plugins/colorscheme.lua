return {
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = false,
				code_style = {
					comments = "italic",
				},
			})
			require("onedark").load()
		end,
	},
}
