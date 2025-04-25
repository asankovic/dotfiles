local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Theme & Fonts
local custom = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom.background = '#11111B'
config.color_schemes = {
	['DarkCatppuccinMocha'] = custom,
}
config.color_scheme = 'DarkCatppuccinMocha'
config.font_size = 11.0
config.font = wezterm.font 'FiraCode Nerd Font'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Window
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'RESIZE'
config.default_prog = { '/usr/bin/zsh', '-l' }

-- Clipboard
local act = wezterm.action
config.keys = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
}

return config
