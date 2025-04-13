return {
	"folke/zen-mode.nvim",
	config = function()
		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })

		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 0.75, -- width of the Zen window
				height = 1, -- height of the Zen window
				options = {},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = true, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 3, -- turn off the statusline in zen mode
				},
				twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				wezterm = {
					enabled = true,
					font = "+20", -- (10% increase per step)
				},
			},
		})
	end,
}
