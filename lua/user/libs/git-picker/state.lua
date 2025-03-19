local M = {}
local H = {}

local BRANCH_CACHE_PATH = vim.fn.expand("~/.local/share/nvim/recent_git_branches.json")
local FILES_CACHE_PATH = vim.fn.expand("~/.local/share/nvim/recent_files.json")

---@class BranchFile
---@field name string
---@field idx integer

---@type string
local last_cwd_branch = ''
---@type string
local last_branch
---@type string
local last_file

---@type table<string, string[]>
local branches_by_cwd = {}
---@type table<string, string[]>
local files_by_branch = {}

---@param file string
M.save_file_to_cache = function(file)
    last_file = file

    if not files_by_branch[last_cwd_branch] then
        files_by_branch[last_cwd_branch] = {}
    end

    local files = files_by_branch[last_cwd_branch]
    local existing_index = vim.fn.index(files, file)

    if existing_index == 0 then -- already on the top of the list
        return
    end

    if existing_index > 0 then
        table.remove(files, existing_index + 1)
    end

    table.insert(files, 1, file)
end

---@param project_cwd string
---@param branch string
M.save_branch_to_state = function (project_cwd, branch)
    last_cwd_branch = project_cwd .. '__' .. branch
    last_branch = branch

    if not branches_by_cwd[project_cwd] then
      branches_by_cwd[project_cwd] = {}
    end

    local branches = branches_by_cwd[project_cwd]

    ---@type integer
    local existing_branch_index = vim.fn.index(branches, branch)

    if existing_branch_index == 0 then -- already on the top of the list
        return
    end

    if existing_branch_index > 0 then
        table.remove(branches, existing_branch_index + 1)
    end

    table.insert(branches, 1, branch)
end

---@param file_path string
---@param data table<string, string[]>
H.save_file = function(data, file_path)
    local json_content = vim.fn.json_encode(data)
    local file, err = io.open(file_path, "w")

    if file then
        file:write(json_content)
    else
        vim.notify("Error: couldn't to write cache file. " .. err)
    end
end

H.load_cache = function()
    if vim.fn.filewritable(BRANCH_CACHE_PATH) ~= 1 then
        H.save_file({}, BRANCH_CACHE_PATH)
        return
    end

    if vim.fn.filewritable(FILES_CACHE_PATH) ~= 1 then
        H.save_file({}, FILES_CACHE_PATH)
        return
    end

    branches_by_cwd = H.read_file(BRANCH_CACHE_PATH)
    files_by_branch = H.read_file(FILES_CACHE_PATH)
end

---@param file_path string
---@return table<string, string[]>
H.read_file = function (file_path)
    local file, err = io.open(file_path, "r")

    if file then
        local json_string = file:read("*a")
        file:close()

        local ok, result = pcall(vim.fn.json_decode, json_string)
        if not ok then return {} end
        return result
    else
        vim.notify('Error reading file ' .. file_path .. ': ' .. err )
        return {}
    end
end

H.load_cache()

---@param new string[]
---@param cache string[]
---@return string[]
H.merge = function(new, cache)
    for cache_index, cache_item in ipairs(cache) do
        local branch_index = vim.fn.index(new, cache_item)

        if branch_index == -1 then -- branch from cache was not found in the fresh branches
            table.remove(cache, cache_index)
            goto continue
        end

        if branch_index + 1 == cache_index then
            goto continue
        end

        table.remove(new, branch_index + 1)
        table.insert(new, cache_index, cache_item)

        ::continue::
    end

    return new
end

---@param cwd string
---@param all_branches string[]
---@return string[]
M.merge_branches_with_cache = function(cwd, all_branches)
    local branches = branches_by_cwd[cwd]

    if not branches then
      return all_branches
    end

    return H.merge(all_branches, branches)
end

M.merge_files_with_cache = function(all_files)
    local cache_files = files_by_branch[last_cwd_branch]

    if not cache_files or #cache_files == 0 then
      return all_files
    end

    return H.merge(all_files, cache_files)
end

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        H.save_file(branches_by_cwd, BRANCH_CACHE_PATH)
        H.save_file(files_by_branch, FILES_CACHE_PATH)
    end
})

---@return string, string
M.get_last_used_branch_and_file = function()
    return last_branch, last_file
end

---@param file string
M.set_last_visited_file = function(file)
    last_file = file
end

return M
