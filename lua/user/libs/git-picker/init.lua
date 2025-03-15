local M = {}
local Snacks = require("snacks")
local state = require('user.libs.git-picker.state')

-- Trim function using pattern matching
local function trim(s)
  -- This pattern removes any combination of spaces and asterisks from the start and end.
  return (s:gsub("^[%s%*]*(.-)[%s%*]*$", "%1"))
end

---@return string
local function get_current_file()
  local full_path = vim.api.nvim_buf_get_name(0)
  local relative_path = vim.fn.fnamemodify(full_path, ':.')
  return relative_path
end

local layout = {
  layout = {
    box = "horizontal",
    width = 0.5,
    height = 0.5,
    {
      box = "vertical",
      border = "rounded",
      title = "Find branch",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
  },
}

---@return string[]
local get_branches = function()
  ---@type string[]
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

---@param branch string
---@return string[]
local function get_files_from_branch(branch)
    ---@type string[]
    local files = {}
    local handle = io.popen("git ls-tree -r --name-only " .. branch)
    local current_file = get_current_file()

    if handle then
        local first_file

        for git_file in handle:lines() do
            if current_file == git_file then
                first_file = true
            else
                table.insert(files, git_file)
            end
        end

        handle:close()

        if first_file then
            table.insert(files, 1, current_file)
        end
    end

    return files
end

---@param branch string
---@param files table
local function open_file_from_branch(branch, files)
    local merged_files = state.merge_files_with_cache(files)
    local items = {}

    for i, item in ipairs(merged_files) do
        table.insert(items, { idx = i, score = 1, filename = item, text = item })
    end

    Snacks.picker.pick({
        items = items,
        formatters = {
            file = {
                filename_first = false,
            }
        },
        format = function(item, _)
            local ret = {}
            local a = Snacks.picker.util.align
            local icon, icon_hl = Snacks.util.icon(item.filename)

            ret[#ret + 1] = { a(icon, 3), icon_hl }
            ret[#ret + 1] = { " " }
            ret[#ret + 1] = { a(item.filename, 20) }

            return ret
        end,
        layout = layout,
        confirm = function(picker, item)
            picker:close()
            state.save_file_to_cache(item.filename)
            vim.cmd(':Gvsplit ' .. branch .. ':' .. item.filename)
        end,
        preview = nil,
    })

end

M.pick_branch_and_file = function()
  local branches = get_branches()
  local cwd, err = vim.uv.cwd()

  if cwd == nil or err ~= nil then
      vim.notify("Error getting cwd: " .. err)
  end

  local merged_with_cache = state.merge_branches_with_cache(cwd, branches)
  local items = {}

  for i, item in ipairs(merged_with_cache) do
    table.insert(items, { idx = i, score = 1, branch = item, text = item })
  end

  Snacks.picker.pick({
    items = items,
    formatters = {
      file = {
        filename_first = false,
      }
    },
    layout = layout,
    format = function(item, _)
      local ret = {}
      local a = Snacks.picker.util.align
      local icon, icon_hl = Snacks.util.icon('git', 'filetype')

      ret[#ret + 1] = { a(icon, 3), icon_hl }
      ret[#ret + 1] = { " " }
      ret[#ret + 1] = { a(item.branch, 20) }

      return ret
    end,
    confirm = function(picker, item)
      picker:close()

      state.save_branch_to_state(cwd, item.branch)
      local files = get_files_from_branch(item.branch)

      if #files > 0 then
        open_file_from_branch(item.branch, files)
      end
    end,
    preview = nil,
  })
end

return M
