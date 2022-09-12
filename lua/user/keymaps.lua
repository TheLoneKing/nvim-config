 local silent_noremap = { noremap = true, silent = true }
local term_silent_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", silent_noremap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", silent_noremap)
keymap("n", "<C-j>", "<C-w>j", silent_noremap)
keymap("n", "<C-k>", "<C-w>k", silent_noremap)
keymap("n", "<C-l>", "<C-w>l", silent_noremap)

keymap("n", "<leader>w", "<cmd>w<CR>", silent_noremap)

keymap("n", "<leader>h", "<cmd>noh<CR>", silent_noremap)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", silent_noremap)
keymap("n", "<C-Down>", ":resize +2<CR>", silent_noremap)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", silent_noremap)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", silent_noremap)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", silent_noremap)
keymap("n", "<S-TAB>", ":bprevious<CR>", silent_noremap)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", silent_noremap)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", silent_noremap)

-- Insert --
-- Press jj or kk fast to exit insert mode 
keymap("i", "jj", "<ESC>", silent_noremap)
keymap("i", "kk", "<ESC>", silent_noremap)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", silent_noremap)
keymap("v", ">", ">gv", silent_noremap)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", silent_noremap)
keymap("v", "<A-k>", ":m .-2<CR>==", silent_noremap)
keymap("v", "p", '"_dP', silent_noremap)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", silent_noremap)
keymap("x", "K", ":move '<-2<CR>gv-gv", silent_noremap)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", silent_noremap)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", silent_noremap)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_silent_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_silent_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_silent_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_silent_opts)
