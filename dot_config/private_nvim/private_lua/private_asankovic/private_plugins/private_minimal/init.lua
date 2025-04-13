return {
	{ "tpope/vim-sleuth" },
	{ "chentoast/marks.nvim", opts = {} },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		opts = {},
	},
	{
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*",
        config = true,
	},
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim"},
        opts = {
            presets = {
                bottom_search = true,
                long_message_to_split = true,
            },
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            indent = { enabled = true },
            input = { enabled = true },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            notifier = { enabled = true },
        },
    }
}