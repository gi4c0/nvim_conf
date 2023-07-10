vim.g['tmux_navigator_no_mappings'] = 1
local opts = {silent = true, noremap = true}

vim.keymap.set("n", "<A-h>", ":<C-U>TmuxNavigateLeft<cr>", opts)
vim.keymap.set("n", "<A-j>", ":<C-U>TmuxNavigateDown<cr>", opts)
vim.keymap.set("n", "<A-k>", ":<C-U>TmuxNavigateUp<cr>", opts)
vim.keymap.set("n", "<A-l>", ":<C-U>TmuxNavigateRight<cr>", opts)
