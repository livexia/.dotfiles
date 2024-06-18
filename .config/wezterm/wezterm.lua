local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

if os.getenv("XDG_SESSION_TYPE") ~= "wayland" or os.getenv("WAYLAND_DISPLAY") == nil then
  config.enable_wayland = false
end

config.front_end = "OpenGL"

config.window_padding = {
  left = "0.4cell",
  right = "0.3cell",
  top = "0.3cell",
  bottom = "0cell",
}

config.font_size = 14.0
config.font = wezterm.font_with_fallback {
  "FiraCode Nerd Font Mono",
  "PingFang SC",
  "Noto Sans CJK SC",
}

config.color_scheme = "Argonaut (Gogh)"
return config
