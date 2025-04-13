return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status")

		local catppuccin_dark = require "lualine.themes.catppuccin-mocha"
		catppuccin_dark.normal.c.bg = "#11111B"

		require("lualine").setup({
			options = {
				theme = catppuccin_dark,
				component_separators = "|",
				section_separators = "",
			},
			tabline = {
				lualine_a = {'mode'},
				lualine_c = {
					{
						"filename",
						path = 3,
						newfile_status = true,
						symbols = {
							newfile = '[N]',
						}
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#fab387" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
					{ "filesize" },
				},
				lualine_z = {'location'},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
		})
	end,
}
