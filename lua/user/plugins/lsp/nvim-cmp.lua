return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  enabled = true,
  lazy = false,

  dependencies = {
    { "hrsh7th/cmp-buffer" }, -- source for text in buffer
    { "petertriho/cmp-git" },
    { "hrsh7th/cmp-path" }, -- source for file system paths
    { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
    { "onsails/lspkind.nvim" }, -- vs-code like pictograms
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = function()
        local autopairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        autopairs.setup{}

        autopairs.add_rules {
          Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts) return opts.char == ">" end),
          Rule("|", "|"):with_pair(cond.before_regex("%(+")):with_move(function(opts) return opts.char == "|" end),
        }

      end
    }
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        ["<C-l>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      -- sources for autocompletion
      preselect = cmp.PreselectMode.None,
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end
        },
        { name = "luasnip" }, -- snippets
        { name = "path" }, -- file system paths
        { name = "buffer", keyword_length = 3 }, -- text within current buffer
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          -- Cut additional info about autocompleted items
          before = function (_entry, vim_item)
            if (vim_item.menu ~= nil and vim.fn.strcharlen(vim_item.menu) > 45) then
              vim_item.menu = vim.fn.strcharpart(vim_item.menu, 1, 42) .. "..."
            end

            return vim_item
          end
        }),
      },
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    require("cmp_git").setup()
  end
}
