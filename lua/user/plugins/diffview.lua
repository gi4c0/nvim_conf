return {
  'sindrets/diffview.nvim',
  keys = {
    {"<leader>gD", ":DiffviewFileHistory %<CR>", desc = "Show file history", silent = true, mode = {"n"}},
    {"<leader>gD", ":DiffviewFileHistory<CR>", desc = "Show selected chunk history", silent = true, mode = {"v"}}
  }
}
