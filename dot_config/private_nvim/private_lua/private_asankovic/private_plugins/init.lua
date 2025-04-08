return {
	{ "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use
	{ "christoomey/vim-tmux-navigator" },
	{ "tpope/vim-sleuth" },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "fade",
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"szw/vim-maximizer",
		keys = {
			{ "<C-w>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				max_lines = 5,
			})
		end,
	},
	{ "tpope/vim-fugitive" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})

			vim.keymap.set("n", "<leader>ng", neogit.open, { silent = true, noremap = true })
			-- vim-fugitive
			vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { silent = true, noremap = true })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
	},
	{ "chentoast/marks.nvim", opts = {} },
	{ "folke/twilight.nvim", opts = {} },
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "121",
			disabled_filetypes = {
				"NvimTree",
				"lazy",
				"mason",
				"help",
				"checkhealth",
				"lspinfo",
				"noice",
				"Trouble",
				"fish",
				"zsh",
				"alpha",
				"help",
				"text",
				"markdown",
			},
		},
	},
}
