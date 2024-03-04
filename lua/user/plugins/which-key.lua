return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },

  config = function()
    local wk = require("which-key")
    wk.register({
      g = { name = "Git", },
      b = { name = "Buffer" },
      c = { name = "Code actions" },
      e = { name = "Errors" },
      f = { name = "Files" },
      h = { name = "Help" },
      l = { name = "Lsp" },
      p = { name = "Swap Parameters" },
      o = { name = "Open" },
      s = { name = "Search" },
      S = { name = "Snippet" },
      u = { name = "Undo tree" },
    }, { prefix = "<leader>" })
  end
}
