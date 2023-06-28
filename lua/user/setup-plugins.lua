local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup-plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'navarasu/onedark.nvim'

-- Git
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'
  use 'airblade/vim-gitgutter'

-- cmp plugins
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lua"


-- File navigation
  use 'kevinhwang91/rnvimr'
  use 'stevearc/oil.nvim'
  use 'nvim-tree/nvim-tree.lua'


-- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

-- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'nvim-tree/nvim-web-devicons'

-- Harpoon
  use 'ThePrimeagen/harpoon'

  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  use 'ThePrimeagen/git-worktree.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'ollykel/v-vim'

-- Other
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'jiangmiao/auto-pairs'
  use 'sirver/ultisnips'
  use 'mbbill/undotree'
  use 'mtth/scratch.vim'
  use 'scrooloose/nerdcommenter'
  -- use 'github/copilot.vim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'jose-elias-alvarez/typescript.nvim'},
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" }
  }

  use {"akinsho/toggleterm.nvim", tag = '*'}
  use 'christoomey/vim-tmux-navigator'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
