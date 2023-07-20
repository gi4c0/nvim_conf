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

require('lazy').setup "user.plugins"

-- Git

  -- { 'neoclide/coc.nvim', branch = 'release' }

-- Other
  -- 'github/copilot.vim'

  -- LSP

  -- '/Users/alekseypanchenko/dev/lint-ts-project.nvim'
