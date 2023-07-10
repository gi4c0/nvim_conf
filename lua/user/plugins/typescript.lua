require("typescript").setup{
  server = {
    on_attach = function (client, bufnr)
      local opts = {buffer = bufnr, remap = false}
      vim.keymap.set("n", "<leader>mrf", ":TypescriptRenameFile<CR>", opts)
      vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
    end
  }
}
