local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

--  Open the scratch window in a horizontal split instead of a vertical one
vim.g.scratch_horizontal = 0
vim.g.scratch_top = 0
vim.g.scratch_no_mappings = 1

vim.g.scratch_height = 100
vim.g.scratch_autohide = 0

keymap('n', '<leader>bs', ':Scratch<CR>', options)
