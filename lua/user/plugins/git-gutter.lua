return {
  'airblade/vim-gitgutter',
  lazy = false,
  keys = {
    -- Jump to next git hunk
    {']g', '<Plug>(GitGutterNextHunk)', noremap = true, silent = true},
    -- Jump to previous git hunk
    {'[g', '<Plug>(GitGutterPrevHunk)', noremap = true, silent = true} ,
    {'<leader>hs', '<Plug>(GitGutterPreviewHunk)', noremap = true, silent = true},
  },
  config = function()
    --  Disable default mappings
    vim.g.gitgutter_map_keys = 0
  end
}
