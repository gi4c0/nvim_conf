require("telescope").load_extension("git_worktree")

local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", options)
keymap("n", "<leader>gW", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", options)
