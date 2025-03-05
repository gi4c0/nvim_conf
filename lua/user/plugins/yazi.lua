local function get_directories()
  local directories = {}

  local handle = io.popen("fd . --type directory")
  if handle then
    for line in handle:lines() do
      table.insert(directories, line)
    end
    handle:close()
  else
    print("Failed to execute fd command")
  end

  return directories
end

return  {
    "mikavilpas/yazi.nvim",
    -- event = "VeryLazy",
    enabled = true,
    keys = {
        {"<leader>r", function() require("yazi").yazi() end, desc = "Open the file manager"},
        {"<leader>R", ':Yazi cwd<CR>', silent = true, desc = "Open the file manager in nvim's working directory"},
        { "<C-f>", function()
          local Snacks = require("snacks")
          local dirs = get_directories()

          return Snacks.picker({
            finder = function()
              local items = {}
              for i, item in ipairs(dirs) do
                table.insert(items, {
                  idx = i,
                  file = item,
                  text = item,
                })
              end
              return items
            end,
            layout = {
              layout = {
                box = "horizontal",
                width = 0.5,
                height = 0.5,
                {
                  box = "vertical",
                  border = "rounded",
                  title = "Find directory",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
              },
            },
            format = function(item, _)
              local file = item.file
              local ret = {}
              local a = Snacks.picker.util.align
              local icon, icon_hl = Snacks.util.icon(file.ft, "directory")
              ret[#ret + 1] = { a(icon, 3), icon_hl }
              ret[#ret + 1] = { " " }
              ret[#ret + 1] = { a(file, 20) }

              return ret
            end,
            confirm = function(picker, item)
              picker:close()
              require("yazi").yazi(nil, item.file)
            end,
          })
        end, desc = "Find directories" },
      },
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = true,

        -- enable these if you are using the latest version of yazi
        use_ya_for_events_reading = true,
        -- use_yazi_client_id_flag = true,
        keymaps = {
          open_file_in_vertical_split = '<c-v>',
          open_file_in_horizontal_split = '<c-s>',
          open_file_in_tab = '<c-t>',
          grep_in_directory = '<c-g>',
          replace_in_directory = '<c-x>',
          cycle_open_buffers = '<tab>',
        },
      },
    }

