vim.g.netrw_liststyle = 3
vim.g.have_nerd_font = true

local opt = vim.opt

opt.mouse = "a"
opt.updatetime = 250

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "·" , extends="›", precedes="‹"}
opt.inccommand = "split"

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true
opt.breakindent = true
opt.scrolloff = 10
opt.sidescrolloff = 5

opt.cursorline = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.splitright = true
opt.splitbelow = true

opt.showmode = false
opt.termguicolors = true