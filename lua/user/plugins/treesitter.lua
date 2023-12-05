return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  enabled = true,

  dependencies = {
    {
      'eckon/treesitter-current-functions',
      keys = {
        {"<leader>fn", ":GetCurrentFunctions<CR>", noremap = true, silent = true}
      }
    }
  },

  config = function()
    -- The actual path for lua parser: /opt/homebrew/Cellar/neovim/0.9.4/lib/nvim/parser/lua.so
    local cachePath = "/Users/alekseypanchenko/.local/share/nvim/tree-sitter-cache"
    vim.opt.runtimepath:append(cachePath)

    require'nvim-treesitter.configs'.setup {
      parser_install_dir = cachePath,
      ensure_installed = {
        "typescript",
        "json",
        "go",
        "lua",
        "rust",
        "yaml",
        "toml",
        "zig",
        "vim",
        "markdown",
        "markdown_inline"
      },     -- one of "all", "language", or a list of languages
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
    }
  end
}
