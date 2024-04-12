local options = { noremap = true, silent = true }

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
keymap("n", "<Down>", ":resize -8<CR>", options)
keymap("n", "<Up>", ":resize +8<CR>", options)
keymap("n", "<Left>", ":vertical resize -8<CR>", options)
keymap("n", "<Right>", ":vertical resize +8<CR>", options)
keymap("n", "<C-s>", ":w<cr>", options)

keymap('n', 'cI', '^ciw', options)

-- Close window with Q
keymap("n", "Q", ":bdelete<cr>", options)
keymap("n", "<leader>sc", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

keymap("n", "[b", ":bprevious<CR>", options)
keymap("n", "]b", ":bnext<CR>", options)

keymap("n", "]t", ":tabnext<CR>", options)
keymap("n", "[t", ":tabprevious<CR>", options)
keymap("n", "tc", ":tabclose<CR>", options)

keymap('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)

keymap('n', '<leader>bD', ':Bonly<CR>', { noremap = true, silent = true, desc = "Delete all buffers except current" })
