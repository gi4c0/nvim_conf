return {
  'neoclide/coc.nvim',
  enabled = true,
  lazy = false,
  branch = 'release',
  dependencies = {
    'jiangmiao/auto-pairs'
  },

  config = function()
    vim.g["coc_global_extensions"] = {
      'coc-json', 'coc-tsserver', 'coc-rust-analyzer', 'coc-format-json',
      'coc-spell-checker', 'coc-yaml', 'coc-sh', 'coc-fish', 'coc-go',
      'coc-protobuf', 'coc-lua', 'coc-zig', 'coc-eslint', 'coc-html', 'coc-css',
      '@yaegassy/coc-tailwindcss3', 'coc-prettier', 'coc-cspell-dicts', 'coc-db'
    }

    local keyset = vim.api.nvim_set_keymap
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
    keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
    keyset("n", "<C-k>", "<Plug>(coc-diagnostic-prev)", {silent = true})
    keyset("n", "<C-j>", "<Plug>(coc-diagnostic-next)", {silent = true})

    -- GoTo code navigation
    keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
    keyset("n", "gt", "<Plug>(coc-type-definition)", {silent = true})
    keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

    -- Use K to show documentation in preview window
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end
    keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

    -- Symbol renaming
    keyset("n", "<leader>mrr", "<Plug>(coc-rename)", {silent = true})

    -- Update signature help on jump placeholder
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("User", {
      group = "CocGroup",
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
      desc = "Update signature help on jump placeholder"
    })

    keyset("i", "<C-s>", "<C-\\><C-o>:call CocActionAsync('showSignatureHelp')<cr>", { silent = true})

    local opts = {silent = true, nowait = true}
    keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
    keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

    local opts = {silent = true, nowait = true, expr = true}
    keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
    keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
    keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

    keyset("n", "<space>el", ":<C-u>CocList diagnostics<cr>", { silent = true, nowait = true })
  end,
}
