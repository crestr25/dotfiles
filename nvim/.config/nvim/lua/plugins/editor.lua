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
        config = function() require("plugins.config.gitsigns") end,
			-- on_attach = function(buffer)
			-- 	local gs = package.loaded.gitsigns
			--
			-- 	local function map(mode, l, r, desc)
			-- 		vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			-- 	end
	},

	-- Tmux
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require('nvim-tmux-navigation')
            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }
		end,
	},
}
