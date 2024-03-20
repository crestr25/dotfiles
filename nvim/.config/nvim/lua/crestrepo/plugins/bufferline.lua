return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})

		-- -- set which-key keymaps
		local wk = require("which-key")

		wk.register({
			b = {
				name = "Buffers",
				n = { "<cmd>bnext<CR>", "Buffer next" },
				p = { "<cmd>bprev<CR>", "Buffer prev" },
				d = { "<cmd>bdelete<CR>", "Buffer del" },
			},
		}, { prefix = "<leader>" })
	end,
}
