local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("keys").setup(config)

-- Fonts Config
config.font = wezterm.font("JetBrains Mono", {weight="Bold"})

-- Colorschema
config.color_scheme = "Ocean (base16)"

-- Windows config
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_opacity = 0.8

-- Tabs config
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false

-- Cursor
-- config.default_cursor_style = "BlinkingBar"

return config
