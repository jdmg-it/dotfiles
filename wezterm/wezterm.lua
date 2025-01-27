-- Pull in the wezterm API
local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_close_confirmation = "NeverPrompt"

-- This is where you actually apply your config choices
config.window_padding = {
	top = 60,
	right = 30,
	left = 30,
	bottom = 30,
}

-- Background
config.window_background_opacity = 0.8 -- Adjust this value as needed
config.macos_window_background_blur = 20 -- Adjust this value as needed

-- UI
config.color_scheme = "Catppuccin Macchiato"

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.font = wezterm.font("Monoid Nerd Font")
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 240 -- hack for smoothness
config.enable_kitty_graphics = true

-- and finally, return the configuration to wezterm
return config
