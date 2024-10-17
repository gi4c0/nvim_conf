return {
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },

  config = function()
    require("telescope").load_extension("smart_open")
  end,

  keys = {
    {'<leader>fr', ':Telescope smart_open<CR>', silent = true, desc = "Recent files"}
  }
}
