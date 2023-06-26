local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files()<cr>", options)
keymap("n", "<leader><space>", ":lua require'harpoon.mark'.add_file()<CR>", options)
keymap("n", "<leader>1", ":lua require'harpoon.ui'.nav_file(1)<CR>", options)
keymap("n", "<leader>2", ":lua require'harpoon.ui'.nav_file(2)<CR>", options)
keymap("n", "<leader>3", ":lua require'harpoon.ui'.nav_file(3)<CR>", options)
keymap("n", "<leader>4", ":lua require'harpoon.ui'.nav_file(4)<CR>", options)
keymap("n", "<leader>5", ":lua require'harpoon.ui'.nav_file(5)<CR>", options)
keymap("n", "<leader>6", ":lua require'harpoon.ui'.nav_file(6)<CR>", options)
keymap("n", "<C-h>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", options)
