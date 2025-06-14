return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- Text editing
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup()

      -- General workflow
      require("mini.bracketed").setup()
      require("mini.files").setup()

      -- Appearance
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        draw = {
          animation = indentscope.gen_animation.none(),
        },
        symbol = "│",
      })

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })

      vim.keymap.set("n", "<leader>ee", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
      end, { desc = "Open MiniFiles" })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })
    end,
  },
}
