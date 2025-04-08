return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next Hunk" })

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Previous Hunk" })

			---- Actions
			-- Visual mode
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage git hunk" })

			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset git hunk" })

			-- Normal mode
			map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
			map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
			map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
			map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
			map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
			map("n", "<leader>hD", function()
				gitsigns.diffthis("@")
			end, { desc = "git [D]iff against last commit" })

			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git Blame line" })
			map("n", "<leader>hB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })

			-- Text object
			-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}
