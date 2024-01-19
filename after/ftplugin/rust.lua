local buf = vim.api.nvim_get_current_buf()

local opts =  { silent = true, buffer = buf, noremap = true };
local keymap = vim.keymap

keymap.set("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, opts)
keymap.set("n", "<leader>ee", function() vim.cmd.RustLsp('explainError') end, opts)
keymap.set("n", "<leader>em", function() vim.cmd.RustLsp('expandMacro') end, opts)
keymap.set("n", "<leader>oc", function() vim.cmd.RustLsp('openCargo') end, opts)

keymap.set("n", "gr", "<cmd>Telescope lsp_references show_line=false<CR>", opts) -- show definition, references
keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
keymap.set("n", "<leader>el", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line
keymap.set("n", "<leader>mrf", ":TSToolsRenameFile<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "<leader>im", ":TSToolsAddMissingImports<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
keymap.set("n", "<leader>mrs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
