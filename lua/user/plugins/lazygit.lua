return {
  'kdheepak/lazygit.nvim',
  keys = {
    {"<leader>gg", ":LazyGit<cr>", noremap = true, silent = true },
  },
  config = function()
    -- vim.g.lazygit_floating_window_winblend = 1
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╰", "╯" }
  end
}
