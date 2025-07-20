local prettier = { "prettierd", "prettier", stop_after_first = true }
local eslint = { "eslint_d" }

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = eslint,
        typescript = eslint,
        go = { "golangcilint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint(nil, { ignore_errors = true })
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint(nil, { ignore_errors = true })
      end, { desc = "File [L]int" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    opts = {
      formatters_by_ft = {
        javascript = prettier,
        typescript = prettier,
        lua = { "stylua" },
        go = { "gofumpt" }
      },
    },
    keys = {
      {
        "<leader>fo",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "x" },
        desc = "[Fo]rmat buffer",
      },
    },
  },
}
