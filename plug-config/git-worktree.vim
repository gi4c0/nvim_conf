lua << EOF
  require("telescope").load_extension("git_worktree")
EOF

nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gW :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
