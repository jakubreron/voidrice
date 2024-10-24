-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox Dark (Gogh)"

-- This is where you actually apply your config choices
config.set_environment_variables = {
	TERM = "xterm-256color",
}

config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.5

-- config.disable_default_key_bindings = true

-- and finally, return the configuration to wezterm
return config
