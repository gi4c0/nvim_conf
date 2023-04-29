require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
-- require "user.cmp"
-- require "user.lsp"
-- require "user.lua-snip"

vim.cmd('source $HOME/.config/nvim/lua/user/coc.vim')
-- vim.cmd('source $HOME/.config/nvim/lua/user/vimspector.vim')
vim.cmd('source $HOME/.config/nvim/scripts/scripts.vim')

require "user.ranger"
require "user.telescope"
require "user.harpoon"
require "user.git-worktree"
require "user.treesitter"
require "user.fugitive"
require "user.lazygit"
require "user.lualine"
require "user.git-gutter"
require "user.ultisnips"
require "user.vim-wiki"
require "user.undotree"
require "user.scratch"
require "user.copilot"
require('user.nerd-commenter')
