return {
  "NeogitOrg/neogit",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    {
      "sindrets/diffview.nvim",
      keys = {
        {"<leader>gd", ":DiffviewFileHistory %<CR>", desc = "Show file history", silent = true, mode = {"n"}},
        {"<leader>gd", ":DiffviewFileHistory<CR>", desc = "Show selected chunk history", silent = true, mode = {"v"}}
      }

    },        -- optional - Diff integration
    {
      'tpope/vim-fugitive',
      enabled = true,
      keys = {
        {"<leader>gb", ":Git blame<cr>", desc = "Git blame", noremap = true, silent = true },
        {"<leader>gp", ":G pull origin v2", noremap = true, silent = true },
        {"<leader>gl", ":0Gclog<cr>", desc = "Current file logs", noremap = true, silent = true },
        {"<leader>gc", ":Gvsplit :%<left><left>", desc = "Git checkout", noremap = true, silent = true },
      }
    }
  },
  opts = {
    disable_hint = true,
    kind = "vsplit",
    commit_view = {
      kind = "tab",
    },
    commit_editor = {
      kind = "split",
    },
    integrations = {
      -- If enabled, use telescope for menu selection rather than vim.ui.select.
      -- Allows multi-select and some things that vim.ui.select doesn't.
      -- telescope = nil,
      -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
      -- The diffview integration enables the diff popup.
      --
      -- Requires you to have `sindrets/diffview.nvim` installed.
      -- diffview = true,

      -- If enabled, uses fzf-lua for menu selection. If the telescope integration
      -- is also selected then telescope is used instead
      -- Requires you to have `ibhagwan/fzf-lua` installed.
      fzf_lua = nil,
    },
  },

  keys = {
    {'<leader>gs', ':Neogit<CR>', desc = "Git status", silent = true}
  }
}
