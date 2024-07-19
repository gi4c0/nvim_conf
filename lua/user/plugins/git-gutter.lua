return {
  'airblade/vim-gitgutter',
  lazy = false,
  enabled = false,
  keys = {
    -- Jump to next git hunk
    {']g', '<Plug>(GitGutterNextHunk)', noremap = true, silent = true},
    -- Jump to previous git hunk
    {'[g', '<Plug>(GitGutterPrevHunk)', noremap = true, silent = true} ,
    {'<leader>gd', '<Plug>(GitGutterPreviewHunk)', noremap = true, silent = true, desc = "Git diff (chunk)"},
  },
  config = function()
    --  Disable default mappings
    vim.g.gitgutter_map_keys = 0
    vim.g.gitgutter_sign_priority = 0
  end
}
