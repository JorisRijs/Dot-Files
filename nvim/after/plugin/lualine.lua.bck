local custom_powerline_dark = require('lualine.themes.powerline_dark')

local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}
custom_powerline_dark.insert.a.fg = colors.white

require('lualine').setup{
    options = {
	icons_enabled = true,
	theme = 'ayu_mirage',
	component_separators = { left = '|', right = '|'},
	section_separators = { left = '', right = ''},
	disabled_filetypes = {
	  statusline = {},
	  winbar = {},
	},
	ignore_focus = {},
	always_divide_middle = true,
	globalstatus = true,
	refresh = {
	  statusline = 1000,
	  tabline = 1000,
	  winbar = 1000,
	}
    }
}
