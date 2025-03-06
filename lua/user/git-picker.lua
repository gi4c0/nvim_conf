-- Trim function using pattern matching
local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local get_branches = function()
  local branches = {}
  local handle = io.popen("git branch")

  if handle then
    for line in handle:lines() do
      table.insert(branches, trim(line))
    end

    handle:close()
    return branches
  else
    vim.notify("Failed to execute git command", "error")
  end
end

local Snacks = require("snacks")
local branches = get_branches()

return Snacks.picker.pick({
  finder = function (opts, ctx)
    local items = {}
    local start_item = nil

    for i, item in ipairs(branches) do
      if item:match('^%*') then
        start_item = { idx = 1, text = item, file = item }
      else
        table.insert(items, { idx = #items + 1, text = item, file = item })
      end
    end

    if start_item then
      table.insert(items, 1, start_item)
    end

    P(items)
    return items
  end,
  formatters = {
    file = {
      filename_first = false,
    }
  },
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
  -- format = function(item, _)
  --   local file = item.file
  --   local ret = {}
  --   local a = Snacks.picker.util.align
  --   local icon, icon_hl = Snacks.util.icon('')
  --   ret[#ret + 1] = { a(icon, 3), icon_hl }
  --   ret[#ret + 1] = { " " }
  --   ret[#ret + 1] = { a(file, 20) }
  --
  --   return ret
  -- end,
  confirm = function(picker, item)
    picker:close()
    P(item)
  end,
})
