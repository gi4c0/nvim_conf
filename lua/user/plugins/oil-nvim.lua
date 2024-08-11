return {
  'stevearc/oil.nvim',
  enabled = false,
  config = function()
      local oil = require("oil")

      oil.setup({
        float = {
            max_width = 75,
            max_height = 30
        }
      })

      vim.api.nvim_create_autocmd("User", {
          pattern = "OilEnter",
          callback = vim.schedule_wrap(function(args)
              if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
                  oil.open_preview()
              end
          end),
      })
  end,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

  keys = {
      {'-', '<CMD>Oil<CR>', { desc = "Open parent directory" }}
  }
}
