local function get_directories()
  local dirs = {}
  for line in io.popen("fd . --type d"):lines() do
    table.insert(dirs, line)
  end
  return dirs
end

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
          truncate = 75
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
    bigfile = {
      notify = true,
      size = 15 * 1024 * 1024, -- 1.5MB
      line_length = 500, -- average line length (useful for minified files)
    }
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.smart({ matcher = { cwd_bonus = true } }) end, desc = "Smart Find Files" },
    { "<C-Space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>F", function() Snacks.explorer({ layout = { preset = "vertical" }, auto_close = true }) end, desc = "File Explorer" },
    -- { "<leader>R", function() Snacks.explorer({ layout = { preset = "vertical" }, auto_close = true, ignored = true, hidden = true }) end, desc = "File Explorer with hidden and ingored" },
    { "<leader>*", function() Snacks.picker.grep_word() end, desc = "Grep word" },
    { "<leader>/", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep" },
    -- { "<leader>fn", function() Snacks.picker.lsp_symbols({ filter = { default = { "Function", "Method" } } }) end, desc = "Show functions and methods" },
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
    { "<leader>fd", function()
      local Snacks = require("snacks")
      local directories = get_directories()
      return Snacks.picker({
        finder = function()
          local items = {}
          for i, dir in ipairs(directories) do
            table.insert(items, {
              idx = i,
              file = { path = dir },
              text = dir,
            })
          end
          return items
        end,
        confirm = function(picker, item)
          picker:close()
          -- Open the files picker with the selected directory as root
          Snacks.picker.pick("files", { dirs = { item.file.path } })
        end,
      })
    end, desc = "Smart Find Files" },
  },
}

