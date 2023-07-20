return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {

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
      }
    }
  end
}
