return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
						{ find = "%d fewer lines" },
						{ find = "%d lines [<=>]ed %d time" },
						{ find = "%d lines %a+ed" },
						{ find = "%d more lines" },
					},
				},
				opts = { skip = true },
			},
		},
		presets = {
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
