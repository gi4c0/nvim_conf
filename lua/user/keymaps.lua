local options = { noremap = true, silent = true }
local term_options = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", options)
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
--  Use alt + hjkl to resize windows
keymap("n", "M-j", ":resize -8<CR>", options)
keymap("n", "M-k", ":resize +8<CR>", options)
keymap("n", "M-h", ":vertical resize -8<CR>", options)
keymap("n", "M-l", ":vertical resize +8<CR>", options)

-- Close window with Q
keymap("n", "Q", ":q<cr>", options)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)
keymap("v", "p", '"_dP', opts)
