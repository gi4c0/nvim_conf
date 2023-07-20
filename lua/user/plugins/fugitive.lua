return {
  'tpope/vim-fugitive',
  keys = {
    {"<leader>gs", ":vertical :Git<cr>", noremap = true, silent = true },
    {"<leader>gS", ":vertical :Git<cr><C-w>o", noremap = true, silent = true },
    {"<leader>gb", ":Git blame<cr>", noremap = true, silent = true },
    {"<leader>gp", ":G pull origin v2", noremap = true, silent = true },
    {"<leader>gt", ":0Gclog<cr>", noremap = true, silent = true },

    {"<leader>glm", ":diffget //3<CR>", noremap = true, silent = true },
    {"<leader>ghm", ":diffget //2<CR>", noremap = true, silent = true },
    {"<leader>gc", ":Gvsplit :%<left><left>", noremap = true, silent = true },
  }
}
