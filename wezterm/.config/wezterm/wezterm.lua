local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("keys").setup(config)

-- Fonts Config
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

-- Colorschema
config.color_scheme = "Ocean (base16)"

-- Windows config
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_opacity = 0.9

-- Tabs config
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Cursor
-- config.default_cursor_style = "BlinkingBar"
--
-- Window
config.window_decorations = "TITLE | RESIZE"
config.initial_rows = 48
config.initial_cols = 150
wezterm.on("gui-startup", function(cmd) -- Set startup window position
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(0, 0)
end)

return config
