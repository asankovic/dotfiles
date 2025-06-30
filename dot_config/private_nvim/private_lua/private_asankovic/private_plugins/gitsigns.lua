return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]g", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]g", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "[G]it [N]ext hunk" })

      map("n", "[g", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[g", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "[G]it [P]revious hunk" })

      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[G]it [S]tage selected hunk" })
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[G]it [R]eset selected hunk" })

      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage Buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[G]it [R]eset Buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[G]it [P]review hunk" })
      map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "[G]it Preview hunk [I]nline" })
      map("n", "<leader>gd", gitsigns.diffthis, { desc = "[G]it [D]iff this" })
      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end, { desc = "[G]it [D]iff with previous version" })
      map("n", "<leader>gQ", function()
        gitsigns.setqflist("all")
      end, { desc = "[G]it [Q]uickfix all hunks" })
      map("n", "<leader>gq", gitsigns.setqflist, { desc = "[G]it [Q]uickfix current hunks" })

      map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "[G]it Toggle [B]lame" })

      map({ "o", "x" }, "ih", gitsigns.select_hunk)
    end,
  },
}
