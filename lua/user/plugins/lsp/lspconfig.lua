return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    cond = vim.env.COC ~= '1',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
        -- { "antosha417/nvim-lsp-file-operations", config = true },

      },
      config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
        })

        -- configure html server
        lspconfig["html"].setup({
          capabilities = capabilities,
        })

        lspconfig["eslint"].setup{}

        -- configure css server
        lspconfig["cssls"].setup({
          capabilities = capabilities,
        })

        -- configure tailwindcss server
        lspconfig["gleam"].setup({
          capabilities = capabilities,
        })

        -- configure tailwindcss server
        lspconfig["gopls"].setup({
          capabilities = capabilities,
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
        })

        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure python server
        lspconfig["pyright"].setup({
          capabilities = capabilities,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })
      end,

      keys = {
        {"K", vim.lsp.buf.hover, silent = true },
        {"gl", vim.diagnostic.open_float, silent = true, desc = "Show line diagnostics"},
        {"<C-k>", vim.diagnostic.goto_prev, silent = true, desc = "Go to Previous error"},
        {"<C-j>", vim.diagnostic.goto_next, silent = true, desc = "Go to Next error"},
      }
    },

    {
      'mrcjkb/rustaceanvim',
      cond = vim.env.COC ~= '1',
      lazy = false,
      config = function()
        vim.g.rustfmt_autosave = true
      end,

      keys = {
        { "<leader>ee", function() vim.cmd.RustLsp('explainError') end, silent = true, noremap = true, desc = "Expand error" },
        { "<leader>cm", function() vim.cmd.RustLsp('expandMacro') end, silent = true, noremap = true, desc = "Expand macro" },
        { "<leader>oc", function() vim.cmd.RustLsp('openCargo') end, silent = true, noremap = true, desc = "Open cargo" }
      }
    },

    { -- Auto format
      'dense-analysis/ale',
      cond = vim.env.COC ~= '1',
      config = function()
        vim.cmd[[
        let g:ale_fixers = {
          \   'typescript': ['prettier'],
          \   'rust': ['rustfmt'],
          \   'go': ['gofmt'],
          \}
          let g:ale_linters_explicit = 1
          let g:ale_fix_on_save = 1
          ]]

        end
      },

      {
        'nvimtools/none-ls.nvim',
        cond = vim.env.COC ~= '1',
        dependencies = {
          { 'davidmh/cspell.nvim' },
          { 'nvimtools/none-ls-extras.nvim' }
        },
        config = function()
          local null_ls = require("null-ls")
          local cspell = require('cspell')

          null_ls.setup({
            sources = {
              cspell.diagnostics,
              cspell.code_actions,
              require("none-ls.code_actions.eslint"),
            },
            fallback_severity = vim.diagnostic.severity.WARN
          })
        end
      },

      {
        'pmizio/typescript-tools.nvim',
        cond = vim.env.COC ~= '1',
        lazy = false,

        config = {
          settings = {
              expose_as_code_action = { 'add_missing_imports', 'organize_imports', 'fix_all' },
              vtsls = {
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true, -- Should improve performance
                  },
                },
              },
            }
          },

          keys = {
            {'<leader>ci', ':TSToolsAddMissingImports<CR>', silent = true, desc = 'Add missing Imports'},
            {'<leader>cI', ':TSToolsOrganizeImports<CR>', silent = true, desc = 'Organize Imports'},
          }
        }
      }
