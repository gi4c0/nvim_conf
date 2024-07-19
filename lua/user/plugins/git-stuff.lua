return {
  {
    'sindrets/diffview.nvim',
    keys = {
      {"<leader>gD", ":DiffviewFileHistory %<CR>", desc = "Show file history", silent = true, mode = {"n"}},
      {"<leader>gD", ":DiffviewFileHistory<CR>", desc = "Show selected chunk history", silent = true, mode = {"v"}}
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
    lazy = false,
    keys = {
      {"<leader>gd", ":Gitsigns preview_hunk<CR>", desc = "Difference hunk preview", silent = true}
    }
  },
  {
    'tpope/vim-fugitive',
    enabled = true,
    keys = {
      {"<leader>gs", ":vertical :Git<cr>", noremap = true, silent = true, desc = "Git status" },
      {"<leader>gS", ":vertical :Git<cr><C-w>o", noremap = true, silent = true, desc = "Git status (full screen)" },
      {"<leader>gb", ":Git blame<cr>", noremap = true, silent = true, desc = "Git blame" },
      {"<leader>gl", ":0Gclog<cr>", noremap = true, silent = true, desc = "Git log of current file" },
      {"<leader>gc", ":Gvsplit :%<left><left>", noremap = true, silent = true, desc = "Show git file on given commit/branch" },
    }
  }
}
