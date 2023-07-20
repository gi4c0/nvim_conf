return {
  'scrooloose/nerdcommenter',

  keys = {
    {"<leader>c<space>", "<Plug>NERDCommenterToggle", noremap = true, silent = true },
    {"<leader>cs", "<Plug>NERDCommenterSexy", noremap = true, silent = true },
  },

  init = function()
    -- Create default mappings
    vim.g.NERDCreateDefaultMappings = 0
    -- Add <n> spaces before comment
    vim.g.NERDSpaceDelims = 1

    -- Use compact syntax for prettified multi-line comments
    vim.g.NERDCompactSexyComs = 0

    -- Allow commenting and inverting empty lines (useful when commenting a region)
    vim.g.NERDCommentEmptyLines = 1

    -- Enable trimming of trailing whitespace when uncommenting
    vim.g.NERDTrimTrailingWhitespace = 1

    -- Enable NERDCommenterToggle to check all selected lines is commented or not
    vim.g.NERDToggleCheckAllLines = 1

    -- Specifies if empty lines should be commented (useful with regions).
    vim.g.NERDCommentEmptyLines = 0

  end
}
