local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.lazygit_floating_window_winblend = 1
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╰", "╯" }

keymap("n", "<leader>gg", ":LazyGit<cr>", options)
