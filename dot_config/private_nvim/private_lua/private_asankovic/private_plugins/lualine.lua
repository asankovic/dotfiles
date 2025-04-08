return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status")

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "buffers" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#fab387" },
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#fab387" },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#fab387" },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#fab387" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
		})
	end,
}
