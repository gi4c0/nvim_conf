return {
  "folke/snacks.nvim",
  priority=1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    words = {},
    lazygit = {},
    image = {},
    picker = {
      filter = {
        cwd = true
      },
      layout = {
        layout ={
          width = 0.85
        }
      },
      formatters = {
        file = {
          filename_first = true,
          truncate = 150
        }
      },
      win = {
        input = {
          keys = {
            ["<C-p>"] = { "toggle_preview", mode = { "i", "n" } },
          }
        }
      }
    },
    notifier = {},
    gitbrowse = {},
    indent = {},
    scratch = {
      win = {
        keys = {
          ['q'] = false,
          ['Q'] = 'close'
        }
      }
    },
    health = {},
    -- bigfile = {
    --   notify = true,
    --   size = 15 * 1024 * 1024, -- 1.5MB
    --   line_length = 500, -- average line length (useful for minified files)
    -- }
  },
  keys = {
    { "<C-p>", function() Snacks.picker.smart({ layout = { preview = false, layout = { width = 0.5 } } }) end, desc = "Smart Find Files" },
    { "<C-Space>", function() Snacks.picker.buffers({ layout = { preview = false } }) end, desc = "Buffers" },
    { "<leader>F", function() Snacks.explorer({ layout = { preset = "vertical", layout = { width = 0.5 } }, auto_close = true }) end, desc = "File Explorer" },
    -- { "<leader>R", function() Snacks.explorer({ layout = { preset = "vertical" }, auto_close = true, ignored = true, hidden = true }) end, desc = "File Explorer with hidden and ingored" },
    { "<leader>*", function() Snacks.picker.grep_word() end, desc = "Grep word" },
    { "<leader>/", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep" },
    { "<leader>fn", function() Snacks.picker.lsp_symbols({ filter = { default = { "Method" } } }) end, desc = "Show functions and methods" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Go to lsp References" },
    { "gt", function() Snacks.picker.lsp_references() end, desc = "Go to Type definitions" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },

    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notifier history" },

    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Show notifier history" },
    { "<leader>bs",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>bS",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "]r",  function() Snacks.words.jump(1, true) end, desc = "Jump reference forward" },
    { "[r",  function() Snacks.words.jump(-1, true) end, desc = "Jump reference backward" },
    { "<leader>gg",  function() Snacks.lazygit() end, desc = "Lazy git" },

    { '<leader>gc', function() require('user.libs.git-picker').pick_branch_and_file() end }
  },
}

