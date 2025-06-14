return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = { ensure_installed = { "prettierd", "eslint_d", "stylua" } },
    },
  },
  opts = {
    ensure_installed = {
      "angularls",
      "gh_actions_ls",
      "ansiblels",
      "bashls",
      "css_variables",
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "emmet_ls",
      "helm_ls",
      "html",
      "jsonls",
      "just",
      "lua_ls",
      "postgres_lsp",
      -- "sqls",
      "tailwindcss",
      "terraformls",
      "ts_ls",
      "yamlls",
    },
  },
}
