require("typescript").setup{
  server = {
    on_attach = function (client, bufnr)
      local opts = {buffer = bufnr, remap = false}
      vim.keymap.set("n", "<leader>mrf", ":TypescriptRenameFile<CR>", opts)
    end
  }
}
