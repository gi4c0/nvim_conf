return {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  cond = vim.env.USE_COC ~= '1',
  enabled = true
}
