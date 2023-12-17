return {
  'ray-x/lsp_signature.nvim',
  enabled = true,
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    },
    toggle_key = '<C-s>',
    toggle_key_flip_floatwin_setting = true,
    hint_enable = false,
    floating_window_above_cur_line = true,
    always_trigger = false,
    timer_interval = 200,
    floating_window = false
  }
}
