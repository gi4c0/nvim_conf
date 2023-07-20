return {
  'christoomey/vim-tmux-navigator',
  init = function()
    vim.g['tmux_navigator_no_mappings'] = 1
  end,

  keys = {
    {"<A-h>", ":<C-U>TmuxNavigateLeft<cr>", noremap = true, silent = true },
    {"<A-j>", ":<C-U>TmuxNavigateDown<cr>", noremap = true, silent = true },
    {"<A-k>", ":<C-U>TmuxNavigateUp<cr>", noremap = true, silent = true },
    {"<A-l>", ":<C-U>TmuxNavigateRight<cr>", noremap = true, silent = true },
  }
}
