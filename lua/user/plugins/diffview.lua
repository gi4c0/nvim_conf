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
  }
}
