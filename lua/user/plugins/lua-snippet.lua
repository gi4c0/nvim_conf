return {
  'L3MON4D3/LuaSnip',
  version = "v2.*",
  build = "make install_jsregexp",

  keys = {
    {"<C-l>", "<cmd> lua require('luasnip').expand()<CR>", silent = true, mode = {"i"}},
    {"<C-l>", "<cmd> lua require('luasnip').jump(1)<CR>", silent = true, mode = {"i", "s"}},
  },

  dependencies = {
    {
      "chrisgrieser/nvim-scissors",
      dependencies = "nvim-telescope/telescope.nvim",
      opts = {
        snippetDir = "~/.dot-files/develop/snippets",
      },

      keys = {
        {"<leader>se", '<cmd>lua require("scissors").editSnippet()<CR>', silent = true},
        {"<leader>sa", '<cmd>lua require("scissors").addNewSnippet()<CR>', silent = true, mode = {"n", "x"}}
      }
    }
  },

  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.dot-files/develop/snippets" } })
  end
}
