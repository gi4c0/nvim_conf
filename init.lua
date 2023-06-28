-- Core
require "user.setup-plugins"
require "user.core.options"
require "user.core.keymaps"
require "user.core.colorscheme"

-- ------ LSP --------
-- require "user.lsp"
-- require "user.lua-snip"
-- require "user.trouble"

vim.cmd('source $HOME/.config/nvim/lua/user/plugins/coc.vim')
vim.cmd('source $HOME/.config/nvim/scripts/scripts.vim')

require "user.plugins.telescope"
require "user.plugins.harpoon"
require "user.plugins.git-worktree"
require "user.plugins.treesitter"
require "user.plugins.fugitive"
require "user.plugins.lazygit"
require "user.plugins.lualine"
require "user.plugins.git-gutter"
require "user.plugins.ultisnips"
require "user.plugins.undotree"
require "user.plugins.scratch"
require "user.plugins.nerd-commenter"
require "user.plugins.nvim-tree"

-- require "user.plugins.terminal"
-- require "user.plugins.copilot"
-- require "user.ranger"
-- vim.cmd('source $HOME/.config/nvim/lua/user/vimspector.vim')
-- require "user.plugins.oil" -- file manager
