local wezterm = require("wezterm")

local config = {
  bold_brightens_ansi_colors = false,
  check_for_updates = false,
  default_prog = { "/usr/bin/zsh" },
  disable_default_key_bindings = true,
  enable_tab_bar = false,
  font_size = 10.0,
  force_reverse_video_cursor = true,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
  launch_menu = {},
  scrollback_lines = 100000,
  set_environment_variables = {},
  term = "wezterm",
  warn_about_missing_glyphs = false,

  colors = {
    foreground = "#dcd7ba",
    background = "#1f1f28",

    cursor_bg = "#c8c093",
    cursor_fg = "#c8c093",
    cursor_border = "#c8c093",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    scrollbar_thumb = "#16161d",
    split = "#16161d",

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  },

  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },

  keys = {
    { key = "v", mods = "SHIFT|CTRL", action = "Paste" },
    { key = "c", mods = "SHIFT|CTRL", action = "Copy" },
    { key = "n", mods = "SHIFT|CTRL", action = wezterm.action.SpawnWindow },
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
  config.term = "" -- Set to empty so FZF works on windows
  config.default_prog = { "cmd.exe" }
  table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
    local year = vsvers:gsub("Microsoft Visual Studio/", "")
    table.insert(config.launch_menu, {
      label = "x64 Native Tools VS " .. year,
      args = { "cmd.exe", "/k", "C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat" },
    })
  end
else
  table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
  table.insert(config.launch_menu, { label = "fish", args = { "fish", "-l" } })
end

return config
