return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl_shortcut = "Include"
			return b
		end
		-- Set header
		dashboard.section.header.val = {
			" ██████╗██████╗        ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			"██╔════╝██╔══██╗       ████╗  ██║██║   ██║██║████╗ ████║",
			"██║     ██████╔╝  ██╗  ██╔██╗ ██║██║   ██║██║██╔████╔██║",
			"██║     ██╔══██╗  ╚═╝  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"╚██████╗██║  ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			" ╚═════╝╚═╝  ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			button("n", "New file", ":ene <BAR> startinsert <CR>"),
			button("f", "Find file", ":Telescope find_files <CR>"),
			button("r", "Recent files", ":Telescope oldfiles <CR>"),
			button("t", "Find text", ":Telescope live_grep <CR>"),
			button("q", "Quit", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
