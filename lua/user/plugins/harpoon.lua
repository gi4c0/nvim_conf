local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

return {
  'ThePrimeagen/harpoon',
  keys = {
    {"<leader><space>", ":lua require'harpoon.mark'.add_file()<CR>", noremap = true, silent = true },
    {"<leader>1", ":lua require'harpoon.ui'.nav_file(1)<CR>", noremap = true, silent = true },
    {"<leader>2", ":lua require'harpoon.ui'.nav_file(2)<CR>", noremap = true, silent = true },
    {"<leader>3", ":lua require'harpoon.ui'.nav_file(3)<CR>", noremap = true, silent = true },
    {"<leader>4", ":lua require'harpoon.ui'.nav_file(4)<CR>", noremap = true, silent = true },
    {"<leader>5", ":lua require'harpoon.ui'.nav_file(5)<CR>", noremap = true, silent = true },
    {"<leader>6", ":lua require'harpoon.ui'.nav_file(6)<CR>", noremap = true, silent = true },
    {"<C-t>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", noremap = true, silent = true },
  }
}
