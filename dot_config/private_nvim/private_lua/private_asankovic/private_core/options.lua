vim.g.netrw_liststyle = 3
vim.g.have_nerd_font = true

local opt = vim.opt

opt.mouse = "a"
opt.updatetime = 250

-- opt.list = true
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- opt.autoindent = true
-- opt.smartindent = true
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

opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false

opt.backspace = "2"
opt.backspace = "indent,eol,start"
--opt.clipboard:append("unnamedplus")

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.swapfile = false

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.autowrite = true
opt.autoread = true
opt.fileformats = "unix,dos" -- c/p from system on WSL2
-- opt.colorcolumn = "80"
-- opt.laststatus = 2
