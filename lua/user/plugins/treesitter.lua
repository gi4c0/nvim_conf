return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  enabled = true,

  dependencies = {
    {
      'eckon/treesitter-current-functions',
      keys = {
        {"<leader>fn", ":GetCurrentFunctionsForce telescope<CR>", noremap = true, silent = true, desc = "Functions in current file"}
      }
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' }
  },

  config = function()
    -- Delete this file if got error about BufRead *
    -- The actual path for lua parser: /opt/homebrew/Cellar/neovim/0.9.5/lib/nvim/parser/lua.so
    local cachePath = "/Users/alekseypanchenko/.local/share/nvim/tree-sitter-cache"
    vim.opt.runtimepath:append(cachePath)

    require'nvim-treesitter.configs'.setup {
      parser_install_dir = cachePath,
      ensure_installed = {
        "typescript",
        "json",
        "gleam",
        "go",
        "lua",
        "rust",
        "yaml",
        "toml",
        "zig",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline"
      },     -- one of "all", "language", or a list of languages
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>pl"] = "@parameter.inner", -- <leader>parameter to the right (l)
          },
          swap_previous = {
            ["<leader>ph"] = "@parameter.inner", -- <leader>parameter to the left (h)
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
        },

        move = {
          enable = true,
          set_jumps = false, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = "@function.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          -- goto_next = {
          --   ["]i"] = "@conditional.outer",
          -- },
          -- goto_previous = {
          --   ["[i"] = "@conditional.outer",
          -- }
        },
      }
    }
  end
}
