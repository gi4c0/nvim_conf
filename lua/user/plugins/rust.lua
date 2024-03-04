return {
  'rust-lang/rust.vim',
  cond = vim.env.USE_COC ~= '1',

  config = function ()
    vim.g.rustfmt_autosave = true
  end,

  keys = {
    { "<leader>ca", function() vim.cmd.RustLsp('codeAction') end,  silent = true, noremap = true, desc = "Code action" },
    { "<leader>ee", function() vim.cmd.RustLsp('explainError') end, silent = true, noremap = true, desc = "Expand error" },
    { "<leader>cm", function() vim.cmd.RustLsp('expandMacro') end, silent = true, noremap = true, desc = "Expand macro" },
    { "<leader>oc", function() vim.cmd.RustLsp('openCargo') end, silent = true, noremap = true }
  }
}
