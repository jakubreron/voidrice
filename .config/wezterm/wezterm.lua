-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.set_environment_variables = {
	TERM = "xterm-256color",
}

config.front_end = "WebGpu"
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.cursor_blink_rate = 0

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 13
config.cell_width = 0.8
config.color_scheme = "Gruvbox (Gogh)"

-- and finally, return the configuration to wezterm
return config
