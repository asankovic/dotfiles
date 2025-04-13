" ============================ Leader key  =============================
if !exists('g:vscode')
  noremap <SPACE> <Nop>
  nnoremap <Space> <Nop>
  vnoremap <Space> <Nop>
endif

let mapleader=" "
" ======================================================================

" ========================== Common settings  ==========================
set visualbell
set mouse=a
set updatetime=250

set list
"set listchars=tab:»\ ,trail:·,nbsp:␣
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set relativenumber
set number

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set shiftround
set breakindent
set scrolloff=10
set sidescrolloff=5

set cursorline
set nowrap
set showmode

set ignorecase
set smartcase
set hlsearch
set incsearch
" ======================================================================

" ========================== General remaps  ===========================
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

"" Exit insert mode
inoremap jk <ESC>

"" Quality of life things
nnoremap Q <Nop>
nnoremap U <C-r>

" Turn off highlighted search
nnoremap <Esc> :nohlsearch<CR>
nnoremap <leader>hl :set hlsearch!<CR>
nnoremap <leader>n :set relativenumber!<CR>

"" Moving to start and end of line
nnoremap L g_
nnoremap H ^
xnoremap L g_
xnoremap H ^
onoremap L g_
onoremap H ^

"" Insert new empty line
nmap zj o<ESC>k
nmap zk O<ESC>j

"" Indent keeping selection
xnoremap < <gv
xnoremap > >gv
xnoremap = =gv

" Select everything
nnoremap == gg<S-v>G

"" Toggle case and start typing
map <leader>ui ~hi
"" Remove selection and toggle case
xmap <leader>ud d~h

" Search for highlighted text
vnoremap // "sy/<C-R>s<CR>

" Yank to system register
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system register
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Move selected line up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Join line without losing the cursor position
nnoremap J mzJ`z

" Scroll up and down keeping the screen aligned
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep the selection in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" ======================================================================
