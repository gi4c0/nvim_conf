call has('python3')

call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}           " Run :call coc#util#install()
  Plug 'kevinhwang91/rnvimr'                                " Ranger
  Plug 'tpope/vim-fugitive'                                 " for git
  Plug 'tpope/vim-unimpaired'                               " Adds shortcuts for fugitive (<[-q>, <[-Q>)
  Plug 'scrooloose/nerdcommenter'                           " Commenting tool
  Plug 'tpope/vim-surround'                                 " Add functionality for surrounding stuff
  Plug 'tpope/vim-repeat'                                   " Enable repeating for surround
  Plug 'jiangmiao/auto-pairs'                               " Auto insert pairs for '{]
  Plug 'sirver/ultisnips'                                   " snippets
  Plug 'airblade/vim-gitgutter'                             " Show git diff
  Plug 'dag/vim-fish'                                       " Support for .fish files
  Plug 'mbbill/undotree'                                    " Kind of git but built in Vim
  Plug 'vimwiki/vimwiki'
  Plug 'kdheepak/lazygit.nvim'                              " Lazy git integration

  " Themes related
  Plug 'navarasu/onedark.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'

  Plug 'nvim-lua/popup.nvim'                                " Required for telescope
  Plug 'nvim-lua/plenary.nvim'                              " Required for telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug 'AckslD/nvim-neoclip.lua'

  Plug 'ThePrimeagen/git-worktree.nvim'                     " Git Worktrees

  Plug 'ThePrimeagen/harpoon'

  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'                       " Required for lualine above

  Plug 'mtth/scratch.vim'
call plug#end()

" ----------- Native vim settings -----------
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

" ----------- Scripts -----------------------
source $HOME/.config/nvim/scripts/scripts.vim

" ===                           PLUGIN SETUP                               === "
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/ranger.vim
source $HOME/.config/nvim/plug-config/markdown.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/nerd-commenter.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/vim-wiki.vim
source $HOME/.config/nvim/plug-config/git-gutter.vim
source $HOME/.config/nvim/plug-config/lazygit.vim
source $HOME/.config/nvim/plug-config/scratch.vim
source $HOME/.config/nvim/plug-config/harpoon.vim

source $HOME/.config/nvim/plug-config/vim-maximizer.vim
source $HOME/.config/nvim/plug-config/vimspector.vim

source $HOME/.config/nvim/plug-config/telescope.vim
luafile $HOME/.config/nvim/plug-config/tree-sitter.lua
luafile $HOME/.config/nvim/plug-config/lualine.lua
source $HOME/.config/nvim/plug-config/git-worktree.vim
luafile $HOME/.config/nvim/plug-config/neoclip.lua

" =========== Themes ============"
source $HOME/.config/nvim/themes/one-dark.vim
" source $HOME/.config/nvim/themes/nv-code.vim
