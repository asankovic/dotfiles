vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set(
  "n",
  '""',
  '<cmd>registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>',
  { silent = true, desc = "Toggle case under cursor and start typing." }
)
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "Q", "<nop>", { desc = "Nope." })
keymap.set("n", "U", "<C-r>", { desc = "Undo the latest undo" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Turn off highlighted search" })
keymap.set("n", "<leader>hl", "<cmd>set hlsearch!<CR>", { desc = "Toggle highlighted search" })
keymap.set("n", "<leader>nn", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative numbering" })

keymap.set({ "n", "o", "x" }, "<s-h>", "^", { desc = "Jump to beginning of line" })
keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { desc = "Jump to end of line" })

keymap.set("n", "zj", "o<ESC>k", { desc = "Insert an empty line below." })
keymap.set("n", "zk", "O<ESC>j", { desc = "Insert an empty line above." })

keymap.set("x", "<", "<gv", { desc = "Remove indent backwards while keeping selection." })
keymap.set("x", ">", ">gv", { desc = "Indent while keeping selection." })
keymap.set("x", "=", "=gv", { desc = "Format while keeping selection." })
keymap.set("n", "==", "gg<S-v>G", { desc = "Select everything" })

keymap.set("n", "<leader>ui", "~hi", { desc = "Toggle case under cursor and start typing." })
keymap.set("x", "<leader>ud", "d~h", { desc = "Remove selection and toggle case." })

keymap.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system register" })
keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system register" })

keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up." })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down." })

keymap.set("n", "J", "mzJ`z", { desc = "Join line without losing the cursor position" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down keeping the screen aligned." })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up keeping the screen aligned." })
keymap.set("n", "n", "nzzzv", { desc = "Keep the selection in the middle of the screen." })
keymap.set("n", "N", "Nzzzv", { desc = "Keep the selection in the middle of the screen." })

-- Less used / important for simple editing
keymap.set("n", "<C-w><", ":vertical resize -10<CR>", { desc = "Reduce size of split vertically." })
keymap.set("n", "<C-w>>", ":vertical resize +10<CR>", { desc = "Expand size of split vertically." })
keymap.set("n", "<C-w>-", ":resize -10<CR>", { desc = "Reduce size of split horizontally." })
keymap.set("n", "<C-w>+", ":resize +10<CR>", { desc = "Expand size of split horizontally." })

keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

function CopyReference()
  local current_buffer = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(current_buffer)
  local project_root = vim.fn.getcwd()
  local relative_file_name = vim.fn.fnamemodify(file_name, ":~:.")
  local line_number = vim.fn.line(".")
  if project_root ~= "" then
    local path_with_line = relative_file_name .. ":" .. line_number
    print("Relative path copied to system and yank registers: " .. path_with_line)
    vim.fn.setreg("+", path_with_line)
    vim.fn.setreg('"', path_with_line)
  else
    print("File not within a project.")
  end
end

keymap.set(
  "n",
  "<leader>cr",
  ":lua CopyReference()<CR>",
  { desc = "Copy path and line of the current file, relative to the cwd" }
)
