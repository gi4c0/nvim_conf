return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('lspconfig').lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end
    },             -- Required
    {
      'ray-x/lsp_signature.nvim',
      opts = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded"
        },
        toggle_key = '<C-s>',
        toggle_key_flip_floatwin_setting = true,
        hint_enable = false,
        always_trigger = false,
        timer_interval = 100
      }
    },          -- Signature

    {
      'jose-elias-alvarez/typescript.nvim',
      opts = {
        server = {
          on_attach = function (client, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "<leader>mrf", ":TypescriptRenameFile<CR>", opts)
            vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
          end
        }
      }
    },

    {
      'nvimdev/lspsaga.nvim',
      opts = {
        rename = {
          auto_save = true,
          quit = "<C-c>",
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = false,
        },
        symbol_in_winbar = {
          enable = false
        },
        project_replace = {
          quit = '<ESC>',
          select = '<TAB>'
        },
        lightbulb = {
          enable = false,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },
        finder = {
          keys = {
            toggle_or_open = '<CR>',
            quit = '<ESC>'
          }
        },
        implement = {
          enable = false
        }
      },

      keys = {
        -- Code action
        {"<leader>aw", "<cmd>Lspsaga code_action<CR>" },

        -- Rename all occurrences of the hovered word for the selected files
        {"<leader>mrr", "<cmd>Lspsaga rename<CR>" },

        -- Peek definition
        -- You can edit the file containing the definition in the floating window
        {"gD", ":Lspsaga peek_definition<CR>", {noremap = true } },

        -- Go to definition
        {"gd", "<cmd>Lspsaga goto_definition<CR>" },

        -- Peek type definition
        -- You can edit the file containing the type definition in the floating window
        -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
        -- It also supports tagstack
        -- Use <C-t> to jump back
        {"gT", "<cmd>Lspsaga peek_type_definition<CR>" },

        -- Go to type definition
        {"<cmd>Lspsaga goto_type_definition<CR>" },


        -- Show line diagnostics
        -- You can pass argument ++unfocus to
        -- unfocus the show_line_diagnostics floating window
        -- keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")

        -- Hover Doc
        -- If there is no hover doc,
        -- there will be a notification stating that
        -- there is no information available.
        -- To disable it just use ":Lspsaga hover_doc ++quiet"
        -- Pressing the key twice will enter the hover window
        {"K", "<cmd>Lspsaga hover_doc<CR>" },

        {"gr", ":Lspsaga finder<CR>" },
      }
      },
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
    {
      'L3MON4D3/LuaSnip',
      version = "2.*",
      build = "make install_jsregexp"
    },     -- Required
    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
        {'davidmh/cspell.nvim'}
      },
      config = function ()
        local null_ls = require("null-ls")
        local cspell = require('cspell')

        null_ls.setup({
          sources = {
            cspell.diagnostics,
            cspell.code_actions,
            null_ls.builtins.code_actions.eslint
          },
          fallback_severity = vim.diagnostic.severity.WARN
        })
      end
    }
  },

  config = function ()
    local lsp = require('lsp-zero').preset({})

    lsp.ensure_installed( {
      'tsserver',
      'eslint',
      'lua_ls',
      'rust_analyzer',
      'gopls',
      'jsonls',
      'dockerls'
    })

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })


    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      lsp.default_keymaps({
        buffer = bufnr,
        omit = {'gD', 'gr', 'K'}
      })

      vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      -- vim.keymap.set("n", "<leader>mrr", function() vim.lsp.buf.rename() end, opts)
    end)

    lsp.skip_server_setup({'tsserver'}) -- We setup config separately in typescript.lua file
    lsp.setup()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
      },
      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      }
    })

    -- GO
    vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]

    --[[ vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go" },
      callback = function()
        local params = vim.lsp.util.make_range_params(nil, "utf-16")
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
            else
              vim.lsp.buf.execute_command(r.command)
            end
          end
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go" },
      callback = function()
        vim.lsp.buf.format()
      end,
    }) ]]

  end
}
