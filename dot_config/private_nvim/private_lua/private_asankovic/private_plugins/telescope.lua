return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"folke/todo-comments.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local telescopeConfig = require("telescope.config")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
				path_display = { "smart" },
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						size = {
							preview_width = 0.65,
							width = "95%",
							height = "95%",
						},
					},
				},
				mappings = {
					i = {
						["<C-j>"] = actions.cycle_history_next,
						["<C-k>"] = actions.cycle_history_prev,
						["<C-x>"] = actions.delete_buffer,
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "noice")
		pcall(require("telescope").load_extension, "live_grep_args")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f?", builtin.help_tags, { desc = "Find in Help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find in Keymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find in Files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in Buffers" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find in Symbols" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find in Marks" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under cursor" })
		vim.keymap.set(
			"n",
			"<leader>fa",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Find by Grep" }
		)
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find in Diagnositcs" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume search" })
		vim.keymap.set("n", "<leader>fe", builtin.oldfiles, { desc = "Find in Recent files" })
		vim.keymap.set("n", "<leader>fgg", builtin.git_status, { desc = "Find in Git affected files" })
		vim.keymap.set("n", "<leader>fgc", builtin.git_bcommits, { desc = "Find in Git commits for current Buffer" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find in TODO comments" })
		vim.keymap.set("n", "<leader>fgb", ":Telescope git_branches<CR>", { desc = "Find in Git branches" })
	end,
}
