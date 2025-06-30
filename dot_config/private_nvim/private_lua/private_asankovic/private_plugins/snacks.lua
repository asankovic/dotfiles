return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true, },
      image = { enabled = true, },
      input = { enabled = true },
      notifier = { enabled = true, timeout = 3000, },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      picker = { enabled = true, matcher = { frecency = true } },
      words = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
    keys = {
      -- Git
      { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open git repository in browser" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit logs" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit current file logs" },

      -- Picker Find
      { "<leader>fw", function() Snacks.picker.buffers() end, desc = "[F]ind [W]indows (Buffers)" },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[F]ind [C]onfig Files" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "[F]ind [F]iles" },
      { "<leader>fg", function() Snacks.picker.git_files() end, desc = "[F]ind [G]it Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "[F]ind [P]rojects" },
      { "<leader>fe", function() Snacks.picker.recent() end, desc = "[F]ind R[e]cent" },

      -- Picker Grep
      { "<leader>fl", function() Snacks.picker.lines() end, desc = "[F]ind Buffer [L]ines" },
      { "<leader>fa", function() Snacks.picker.grep() end, desc = "[F]ind [A]ll (Grep)" , mode = { "n" } },
      { "<leader>fa", function() Snacks.picker.grep_word() end, desc = "[F]ind [A]ll (Grep)" , mode = { "x" } },

      { '<leader>sr', function() Snacks.picker.registers() end, desc = "[S]earch [R]egisters" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "[S]earch History" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "[S]earch [B]uffer Lines" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "[S]earch [C]ommand History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "[S]earch ALL [C]ommands" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp Pages" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "[S]earch [J]umps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "[S]earch [L]ocation List" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "[S]earch [M]arks" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[S]earch [Q]uickfix List" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },

      { "<leader>rs", function() Snacks.picker.resume() end, desc = "[R]esume [S]earch" },

      { "<leader>fu", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Find LSP references" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
      { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Find LSP Symbols" },

      -- Misc
      { "<leader>et", mode = { "n" }, function() Snacks.explorer.open() end, desc = "Open explorer tree" },
      { "<leader>rn", function() Snacks.rename.rename_file() end, desc = "[R]e[n]ame File" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "[N]otification [H]istory" },
      { "<leader>nc", function() Snacks.notifier.hide() end, desc = "[N]otifications [C]lear" },
      { "<leader>rn", function() Snacks.words.jump(vim.v.count1) end, desc = "[R]eference [N]ext", mode = { "n", "t" } },
      { "<leader>rp", function() Snacks.words.jump(-vim.v.count1) end, desc = "[R]eference [P]revious", mode = { "n", "t" } },
      { "<C-q>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tn")
          Snacks.toggle.option("hlsearch", { name = "Higlight Search" }):map("<leader>th")
          Snacks.toggle.line_number():map("<leader>tl")
          Snacks.toggle.diagnostics():map("<leader>td")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>tc")
          Snacks.toggle.treesitter():map("<leader>tT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
          Snacks.toggle.inlay_hints():map("<leader>ti")
          Snacks.toggle.indent():map("<leader>tg")
          Snacks.toggle.dim():map("<leader>tD")
          Snacks.toggle.words():map("<leader>tr")
        end,
    })
    end,
  }
}
