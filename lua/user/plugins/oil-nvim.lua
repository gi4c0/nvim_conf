return {
  'stevearc/oil.nvim',
  enabled = false,
  config = function()
      local oil = require("oil")

      oil.setup({
        float = {
          max_width = 75,
          max_height = 30
        },
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-l>"] = "actions.select",
          ["<C-v>"] = { "actions.select", opts = { vertical = true } },
          ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<C-r>"] = "actions.refresh",
          ["<C-h>"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
      })

      -- vim.api.nvim_create_autocmd("User", {
      --     pattern = "OilEnter",
      --     callback = vim.schedule_wrap(function(args)
      --         if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      --             oil.open_preview()
      --         end
      --     end),
      -- })
  end,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons

  keys = {
      {'-', '<CMD>Oil --float<CR>', { desc = "Open parent directory" }}
  }
}
