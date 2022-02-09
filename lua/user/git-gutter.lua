local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

--  Disable default mappings
vim.g.gitgutter_map_keys = 0

-- Jump to next git hunk
keymap('n', ']g', '<Plug>(GitGutterNextHunk)', {})

-- Jump to previous git hunk
keymap('n', '[g', '<Plug>(GitGutterPrevHunk)', {})

keymap('n', '<leader>hs', '<Plug>(GitGutterPreviewHunk)', {})
