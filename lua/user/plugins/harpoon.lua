return {
  'ThePrimeagen/harpoon',
  keys = {
    {"<leader><space>", ":lua require'harpoon.mark'.add_file()<CR>", noremap = true, silent = true, desc = "Set harpoon mark"},
    {"<leader>1", ":lua require'harpoon.ui'.nav_file(1)<CR>", noremap = true, silent = true, desc = "Set mark 1"},
    {"<leader>2", ":lua require'harpoon.ui'.nav_file(2)<CR>", noremap = true, silent = true, desc = "Set mark 2"},
    {"<leader>3", ":lua require'harpoon.ui'.nav_file(3)<CR>", noremap = true, silent = true, desc = "Set mark 3"},
    {"<leader>4", ":lua require'harpoon.ui'.nav_file(4)<CR>", noremap = true, silent = true, desc = "Set mark 4"},
    {"<leader>5", ":lua require'harpoon.ui'.nav_file(5)<CR>", noremap = true, silent = true, desc = "Set mark 5"},
    {"<leader>6", ":lua require'harpoon.ui'.nav_file(6)<CR>", noremap = true, silent = true, desc = "Set mark 6"},
    {"<C-t>", ":lua require'harpoon.ui'.toggle_quick_menu()<CR>", noremap = true, silent = true },
  }
}
