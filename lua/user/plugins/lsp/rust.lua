return {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  cond = vim.env.COC ~= '1',
  enabled = true
}
