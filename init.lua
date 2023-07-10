-- Core
require "user.setup-plugins"
require "user.core.options"
require "user.core.keymaps"
require "user.core.colorscheme"
require "user.core.globals"

-- ------ LSP --------
require "user.plugins.lsp"
require "user.plugins.lua-snip"
require "user.plugins.lua-ls"
require "user.plugins.typescript"
require "user.plugins.trouble"
require "user.plugins.lsp-saga"
require "user.plugins.lsp-signature"
require "user.plugins.null-ls"

-- vim.cmd('source $HOME/.config/nvim/lua/user/plugins/coc.vim')
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
require "user.plugins.oil" -- file manager

-- Custom
require "user.plugins.lint-node"

-- require "user.plugins.nvim-tree"
-- require "user.plugins.terminal"
-- require "user.plugins.copilot"
-- require "user.ranger"
-- vim.cmd('source $HOME/.config/nvim/lua/user/vimspector.vim')
