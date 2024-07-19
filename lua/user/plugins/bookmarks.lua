return {
  'tomasky/bookmarks.nvim',
  dependecies = {
    'nvim-telescope/telescope.nvim'
  },
  -- after = "telescope.nvim",
  lazy = false,
  config = function()
    require('bookmarks').setup({
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
      keywords =  {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(bufnr)
        local bm = require "bookmarks"
        local map = vim.keymap.set

      end
    })

    require('telescope').load_extension('bookmarks')

  end,

  keys = {
    { "<leader>mm", ":lua require('bookmarks').bookmark_toggle()<CR>", silent = true, desc = "add or remove bookmark at current line" },
    { "<leader>mi", ":lua require('bookmarks').bookmark_ann()<CR>", silent = true, desc = "add or edit mark annotation at current line" },
    { "<leader>mc", ":lua require('bookmarks').bookmark_clean()<CR>", silent = true, desc = "clean all marks in local buffer" },
    { "<leader>mn", ":lua require('bookmarks').bookmark_next()<CR>", silent = true, desc = "jump to next mark in local buffer" },
    { "<leader>mp", ":lua require('bookmarks').bookmark_prev()<CR>", silent = true, desc = "jump to previous mark in local buffer" },
    { "<leader>ml", ":Telescope bookmarks list<CR>", silent = true, desc = "Bookmarks list (Telesclope)" },
    { "<leader>mx", ":lua require('bookmarks').bookmark_clear_all()<CR>", silent = true, desc = "removes all bookmarks" },
  }
}
