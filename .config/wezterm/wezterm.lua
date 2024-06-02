local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_wayland = false
config.front_end = "OpenGL"

config.window_padding = {
  left = "0.4cell",
  right = "0.3cell",
  top = "0.3cell",
  bottom = "0cell",
}

config.font_size = 14.0
config.color_scheme = "Argonaut (Gogh)"
return config
