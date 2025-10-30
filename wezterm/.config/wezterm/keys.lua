local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.setup(config)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		-- Tabs
		{ mods = "LEADER", key = "t", action = act.SpawnTab("CurrentPaneDomain") },
		{ mods = "LEADER", key = "l", action = act({ ActivateTabRelative = 1 }) },
		{ mods = "LEADER", key = "h", action = act({ ActivateTabRelative = -1 }) },
		{ mods = "LEADER", key = "<", action = act.MoveTabRelative(1) },
		{ mods = "LEADER", key = ">", action = act.MoveTabRelative(-1) },
		{ mods = "LEADER", key = "x", action = act.CloseCurrentTab { confirm = true} },
		-- Panes
		{ mods = "LEADER", key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "m", action = act.TogglePaneZoomState },
		{ mods = "LEADER", key = "Enter", action = act.ActivateCopyMode },
		-- Move between split panes
		M.split_nav("move", "h"),
		M.split_nav("move", "j"),
		M.split_nav("move", "k"),
		M.split_nav("move", "l"),
        -- Resize Wezterm panes
		M.split_nav("resize", "h"),
		M.split_nav("resize", "j"),
		M.split_nav("resize", "k"),
		M.split_nav("resize", "l"),
	}
end

function M.split_nav(resize_or_move, key)
	local direction_keys = {
		Left = "h",
		Down = "j",
		Up = "k",
		Right = "l",
		-- reverse lookup
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}
	return {
		key = key,
		mods = resize_or_move == "resize" and "SUPER" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if M.is_vim(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "SUPER" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

function M.is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

return M
