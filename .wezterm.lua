local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	max_fps = 120,
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "AlwaysPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "jellybeans-nvim",
	window_background_opacity = 0.92,
	text_background_opacity = 0.735,
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
	window_padding = {
		left = 17,
		right = 17,
		top = 17,
		bottom = 8,
	},

	-- Keybindings for splitting the terminal, switching panes, and closing a pane
	keys = {
		-- Horizontal Split
		{ key = "H", mods = "SHIFT|CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		-- Vertical Split
		{ key = "V", mods = "SHIFT|CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Switch to the next pane
		{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Next") },

		-- Switch to the previous pane
		{ key = "Tab", mods = "SHIFT|CTRL", action = wezterm.action.ActivatePaneDirection("Prev") },

		-- Close the current pane
		{ key = "Q", mods = "SHIFT|CTRL", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	},
}

return config