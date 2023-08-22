return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local cachePath = "/Users/alekseypanchenko/.local/share/nvim/tree-sitter-cache"
    vim.opt.runtimepath:append(cachePath)

    require'nvim-treesitter.configs'.setup {
      parser_install_dir = cachePath,
      ensure_installed = {
        "typescript",
        "json",
        "go",
        -- "lua",
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
      }
    }
  end
}
