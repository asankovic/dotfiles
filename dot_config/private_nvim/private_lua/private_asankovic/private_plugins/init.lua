return {
  {
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
              mantle = "#11111B",
            },
          },
        })
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
    },
  },
  { "nvim-lua/plenary.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        hover = {
          -- Set not show a message if hover is not available
          -- ex: shift+k on Typescript code
          silent = true,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<CR>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)",
    },
    },
  },
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
        },
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = {},
    config = function()
      vim.keymap.set({ "n", "x" }, "<leader>rf", function()
        return require("refactoring").refactor("Extract Function")
      end, { expr = true, desc = "Extract Function" })

      vim.keymap.set({ "n", "x" }, "<leader>rF", function()
        return require("refactoring").refactor("Extract Function To File")
      end, { expr = true, desc = "Extract Function To File" })

      vim.keymap.set({ "n", "x" }, "<leader>rv", function()
        return require("refactoring").refactor("Extract Variable")
      end, { expr = true, desc = "Extract Variable" })

      vim.keymap.set({ "n", "x" }, "<leader>rI", function()
        return require("refactoring").refactor("Inline Function")
      end, { expr = true, desc = "Inline Function" })

      vim.keymap.set({ "n", "x" }, "<leader>ri", function()
        return require("refactoring").refactor("Inline Variable")
      end, { expr = true, desc = "Inline Variable" })

      vim.keymap.set({ "n", "x" }, "<leader>rbb", function()
        return require("refactoring").refactor("Extract Block")
      end, { expr = true, desc = "Extract Block" })

      vim.keymap.set({ "n", "x" }, "<leader>rbf", function()
        return require("refactoring").refactor("Extract Block To File")
      end, { expr = true, desc = "Extract Block To File" })

      vim.keymap.set({ "n", "x" }, "<leader>rr", function()
        require("refactoring").select_refactor()
      end, { desc = "Select Refactor UI" })
    end,
  },
}
