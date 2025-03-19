local M = {}

---@param name string
---@return string
M.extract_entry_name = function(name)
    return name:match("([^/]+)$")
end

---@param path string
---@return string
M.extract_dir = function(path)
    local trimmed = path:gsub("/$", "")
    return trimmed:match("(.*/)")
end


return M
