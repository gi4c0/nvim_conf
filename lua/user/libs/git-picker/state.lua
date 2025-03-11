local M = {}

local FILE_CACHE = vim.fn.expand("~/.local/share/nvim/recent_git_branches.txt")

---@type string[]
local cache = {}

---@param branch string
M.save_to_state = function (branch)
    ---@type integer
    local existing_branch_index = vim.fn.index(cache, branch);

    if existing_branch_index == 0 then -- already on the top of the list
        return
    end

    if existing_branch_index > 0 then
        table.remove(cache, existing_branch_index + 1)
    end

    table.insert(cache, 1, branch)
end

local function load_cache()
    if #cache > 0 then
        return cache
    end

    if vim.fn.filewritable(FILE_CACHE) ~= 1 then
        vim.fn.writefile({}, FILE_CACHE)
        return {}
    end

    cache = vim.fn.readfile(FILE_CACHE)
end

local function remove_from_cache(branch)
    local index = vim.fn.index(cache, branch)

    if index == -1 then
        return
    end

    table.remove(cache, index + 1)
end

---@param all_branches string[]
---@return string[]
M.merge_branches_with_cached = function(all_branches)
    load_cache()
    local result = vim.fn.deepcopy(all_branches)

    for cache_index, cache_branch in ipairs(cache) do
        local branch_index = vim.fn.index(result, cache_branch)

        if branch_index == -1 then -- branch from cache was not found in the fresh branches
            remove_from_cache(cache_branch)
            goto continue
        end

        if branch_index + 1 == cache_index then
            goto continue
        end

        table.remove(result, branch_index + 1)
        table.insert(result, cache_index, cache_branch)

        ::continue::
    end

    return result
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    P("hello")
    vim.fn.writefile(cache, FILE_CACHE)
  end
})

return M

