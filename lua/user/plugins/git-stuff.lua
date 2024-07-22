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
    dependencies = {
      { -- pretty git log
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" }
      },
    },

    keys = {
      {"<leader>gs", ":vertical :Git<CR>", noremap = true, silent = true, desc = "Git status" },
      {"<leader>gS", ":vertical :Git<CR><C-w>o", noremap = true, silent = true, desc = "Git status (full screen)" },
      {"<leader>gb", ":Git blame<CR>", noremap = true, silent = true, desc = "Git blame" },
      {"<leader>gl", ":Flogsplit -path=%<CR>", noremap = true, silent = true, desc = "Git log of current file" },
      {"<leader>gL", ":Flogsplit<CR>", noremap = true, silent = true, desc = "Git log of repository file" },
      {"<leader>gc", ":Gvsplit :%<left><left>", noremap = true, silent = true, desc = "Show git file on given commit/branch" },
    }
  },
}
