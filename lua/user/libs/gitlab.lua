local M = {}

local private_token = vim.env.GITLAB_PRIVATE_TOKEN

--- @param url string
local function async_curl(url)
    local co = coroutine.running()
    if not co then
        error("async_curl must be called from within a coroutine!")
    end

    if not private_token then
        coroutine.resume(co, { 'GITLAB_PRIVATE_TOKEN env is not set' })
    end

    vim.system({ "curl", "-s", "-H", "PRIVATE-TOKEN: " .. private_token, url }, { text = true }, function(result)
        if result.code ~=0 then
            coroutine.resume(co, { 'Failed to fetch data from url: ' .. url .. '. Error: ' .. result.stderr or result.stdout, nil })
        end

        local data = vim.json.decode(result.stdout)


        if data.message then
            coroutine.resume(co, { 'API Error: ' .. data.message, nil })
        end

        coroutine.resume(co, { data, nil })
    end)

    -- Pause execution here until resumed
    return coroutine.yield()
end

--- @param url string
M.show_mr = function(url)
    coroutine.wrap(function()
        local success, err = pcall(function()
            --- @type nil | string, nil | string
            local repo, mr_id = url:match("([^/]+)/%-/merge_requests/(%d+)")

            if not repo or not mr_id then
                error("Couldn't parse the url")
            end

            local project_response = async_curl('https://gitlab.gosystem.io/api/v4/projects?search=' .. repo)
            local project_data, project_err = project_response[1], project_response[2]

            if project_err then
                error(project_err)
            end

            -- TODO: handle multiple projects via snacks picker
            --- @type number
            local project_id = project_data[1].id

            local mr_response = async_curl('https://gitlab.gosystem.io/api/v4/projects/' .. project_id .. '/merge_requests/' .. mr_id)
            local mr_data, mr_err = mr_response[1], mr_response[2]

            if mr_err then
                error(mr_err)
            end

            --- @type string, string
            local target_branch, source_branch = mr_data.target_branch, mr_data.source_branch
            P({target_branch, source_branch})

            vim.schedule(function()
                vim.cmd('CodeDiff origin/' .. target_branch .. ' origin/' .. source_branch)
            end)
        end)

        if not success then
            vim.schedule(function()
                vim.notify("Error:\n" .. tostring(err), vim.log.levels.ERROR)
            end)
        end
    end)()
end

return M
