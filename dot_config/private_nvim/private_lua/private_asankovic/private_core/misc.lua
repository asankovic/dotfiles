vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})

vim.cmd([[highlight YankHighlight guibg=#cba6f7]])

-- Optimized Folding with Treesitter
function Foldexpr()
  local buf = vim.api.nvim_get_current_buf()
  if vim.b[buf].ts_folds == nil then
    -- as long as we don't have a filetype, don't bother
    -- checking if treesitter is available (it won't)
    if vim.bo[buf].filetype == "" then
      return "0"
    end
    if vim.bo[buf].filetype:find("dashboard") then
      vim.b[buf].ts_folds = false
    else
      vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
    end
  end
  return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end

vim.opt.foldmethod = "expr"
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldexpr = "v:lua.Foldexpr()"
  -- vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()" --LSP option
else
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

vim.opt.foldlevelstart = 99
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
}
