return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      sync_install = false,
      ensure_installed = {
        "angular",
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "helm",
        "html",
        "javascript",
        "json",
        "lua",
        "query",
        "scss",
        "sql",
        "terraform",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "<leader>v",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
