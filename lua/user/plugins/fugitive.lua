return {
  'tpope/vim-fugitive',
  enabled = true,
  keys = {
    {"<leader>gs", ":vertical :Git<cr>", noremap = true, silent = true, desc = "Git status" },
    {"<leader>gS", ":vertical :Git<cr><C-w>o", noremap = true, silent = true, desc = "Git status (full screen)" },
    {"<leader>gb", ":Git blame<cr>", noremap = true, silent = true, desc = "Git blame" },
    {"<leader>gp", ":G pull origin v2", noremap = true, silent = true, desc = "Pull v2" },
    {"<leader>gl", ":0Gclog<cr>", noremap = true, silent = true, desc = "Git log of current file" },
    {"<leader>gc", ":Gvsplit :%<left><left>", noremap = true, silent = true, desc = "Show git file on given commit/branch" },
  }
}
