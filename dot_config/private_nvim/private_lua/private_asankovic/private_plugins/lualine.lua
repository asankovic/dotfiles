return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local catppuccin_dark = require("lualine.themes.catppuccin-mocha")
    catppuccin_dark.normal.c.bg = "#11111B"

    require("lualine").setup({
      options = {
        theme = catppuccin_dark,
        component_separators = "|",
        section_separators = "",
      },
      tabline = {
        lualine_a = { "filename" },
        lualine_b = { "filesize" },
        lualine_c = { "lsp_status", "diagnostics" },

        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#fab387" },
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#fab387" },
          },
          "diff",
          "branch",
        },
        lualine_y = { "fileformat", "encoding" },
        lualine_z = { "location", "progress" },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
