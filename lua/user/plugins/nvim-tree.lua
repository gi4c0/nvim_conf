-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  view = {
    width = 55,
    -- float = {
      -- enable = true,
      -- quit_on_focus_loss = true,
      -- open_win_config = {
        -- relative = "editor",
        -- border = "rounded",
        -- width = 150,
        -- height = 80,
        -- row = 20,
        -- col = 20,
      -- },
    -- },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>r", "::NvimTreeFindFile<CR>", {silent = true, noremap = true})
