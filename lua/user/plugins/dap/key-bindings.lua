local options = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dt", require('dapui').toggle, options)
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", options)
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", options)
vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", options)

