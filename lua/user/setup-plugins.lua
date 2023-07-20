  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- My plugins here
  "wbthomason/packer.nvim", -- Have packer manage itself
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "navarasu/onedark.nvim",

-- Git
  'tpope/vim-fugitive',
  'kdheepak/lazygit.nvim',
  'airblade/vim-gitgutter',

-- cmp plugins
  "L3MON4D3/LuaSnip",
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/cmp-nvim-lua",


-- File navigation
  'kevinhwang91/rnvimr',
  'stevearc/oil.nvim',
  'nvim-tree/nvim-tree.lua',


-- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-telescope/telescope-file-browser.nvim'}
    }
  },

-- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  'nvim-tree/nvim-web-devicons',

-- Harpoon
  'ThePrimeagen/harpoon',

  -- { 'neoclide/coc.nvim', branch = 'release' }

  'ThePrimeagen/git-worktree.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'ollykel/v-vim',

-- Other
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',
  'sirver/ultisnips',
  'mbbill/undotree',
  'mtth/scratch.vim',
  'scrooloose/nerdcommenter',
  -- 'github/copilot.vim'

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'ray-x/lsp_signature.nvim'},          -- Signature
      {'jose-elias-alvarez/typescript.nvim'},
      {'nvimdev/lspsaga.nvim'},
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
          {'davidmh/cspell.nvim'}
        }
      }
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  'christoomey/vim-tmux-navigator',

  -- '/Users/alekseypanchenko/dev/lint-ts-project.nvim'
  {
    'gi4c0/lint-node.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'}
    }
  }
}
