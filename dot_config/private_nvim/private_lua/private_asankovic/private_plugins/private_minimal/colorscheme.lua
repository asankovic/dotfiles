return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					mocha = {
						base = "#11111B",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
