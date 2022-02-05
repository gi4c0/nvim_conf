local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<leader>gs", ":vertical :Git<cr>", options)
keymap("n", "<leader>gS", ":vertical :Git<cr><C-w>o", options)
keymap("n", "<leader>gb", ":Git blame<cr>", options)
keymap("n", "<leader>gp", ":G pull origin master", options)
keymap("n", "<leader>gt", ":0Gclog<cr>", options)

keymap("n", "<leader>glm", ":diffget //3<CR>", options)
keymap("n", "<leader>ghm", ":diffget //2<CR>", options)
keymap("n", "<leader>gc", ":Gvsplit :%<left><left>", options)
