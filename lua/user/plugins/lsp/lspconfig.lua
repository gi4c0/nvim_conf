return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "pmizio/typescript-tools.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      'nvimtools/none-ls.nvim',
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
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references show_line=false<CR>", opts) -- show definition, references

      -- opts.desc = "Go to declaration"
      -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      -- opts.desc = "Show LSP definitions"
      -- keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      -- opts.desc = "See available code actions"
      -- keymap.set({ "n", "v" }, "<leader>aw", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      -- opts.desc = "Smart rename"
      -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>el", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Rename file"
      keymap.set("n", "<leader>mrf", ":TSToolsRenameFile<CR>", opts) -- jump to previous diagnostic in buffer

      opts.desc = "Rename file"
      keymap.set("n", "<leader>im", ":TSToolsAddMissingImports<CR>", opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      -- opts.desc = "Show documentation for what is under cursor"
      -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>mrs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    -- local capabilities = cmp_nvim_lsp.update_capabilities(
    --   vim.lsp.protocol.make_client_capabilities()
    -- )

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- capabilities.textDocument.completion.completionItem.snippetSupport = false

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure rust server with plugin
    -- lspconfig["rust_analyzer"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    lspconfig["eslint"].setup{}
    -- lspconfig["typos_lsp"].setup{}

    -- lspconfig["tsserver"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    require("typescript-tools").setup {
      on_attach = on_attach,
    }

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
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
    {"<leader>lr", ":LspRestart<CR>", silent = true},
    {"<leader>li", ":LspInfo<CR>", silent = true},
  }
}
