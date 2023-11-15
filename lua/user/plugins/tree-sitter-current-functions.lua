return {
  'eckon/treesitter-current-functions',
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },

  keys = {
    {"<leader>fn", ":GetCurrentFunctions<CR>", noremap = true, silent = true}
  }
}
