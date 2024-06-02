local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_wayland = false
config.front_end = "OpenGL"

return config
