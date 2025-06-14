local prettier = { "prettierd", "prettier", stop_after_first = true }
local eslint = { "eslint_d" }

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      linters_by_ft = {
        javascript = eslint,
        typescript = eslint,
      },
    },
    config = function()
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint(nil, { ignore_errors = true })
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        require("lint").try_lint(nil, { ignore_errors = true })
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
