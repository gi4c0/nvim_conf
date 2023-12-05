return {
  'ray-x/lsp_signature.nvim',
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    },
    toggle_key = '<C-s>',
    toggle_key_flip_floatwin_setting = true,
    hint_enable = false,
    always_trigger = false,
    timer_interval = 100
  }
}
