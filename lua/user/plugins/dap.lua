return {
    'mfussenegger/nvim-dap',
    lazy = false,
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },

    keys = {
        { '<leader>d<space>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' } },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        { '<leader>dl', function() require('dap').step_over() end, { desc = 'Debug: Step Over' } },
        { '<leader>dj', function() require('dap').step_into() end, { desc = 'Debug: Step Into' } },
        { '<leader>dk', function() require('dap').step_out() end, { desc = 'Debug: Step Out' } },
        { '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' } },
        { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Set Conditional Breakpoint' } },
        { '<leader>dt', function() require('dap').terminate() end, { desc = 'Debug: Terminate' } },
        { '<leader>dd', function() require('dapui').toggle() end, { desc = 'Debug: Toggle UI' } },
        { '<leader>de', function() require('dapui').eval() end, { desc = 'Debug: Evaluate Expression' }, mode = {'n', 'v'} },
    },

    opts = function()
        local dap = require("dap")
        if not dap.adapters["pwa-node"] then
            require("dap").adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    -- 💀 Make sure to update this path to point to your installation
                    args = {
                        -- LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
                        vim.fn.exepath('js-debug-adapter'),
                        "${port}",
                    },
                },
            }
        end
        if not dap.adapters["node"] then
            dap.adapters["node"] = function(cb, config)
                if config.type == "node" then
                    config.type = "pwa-node"
                end
                local nativeAdapter = dap.adapters["pwa-node"]
                if type(nativeAdapter) == "function" then
                    nativeAdapter(cb, config)
                else
                    cb(nativeAdapter)
                end
            end
        end

        local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

        local vscode = require("dap.ext.vscode")
        vscode.type_to_filetypes["node"] = js_filetypes
        vscode.type_to_filetypes["pwa-node"] = js_filetypes

        for _, language in ipairs(js_filetypes) do
            if not dap.configurations[language] then
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end
        end
    end,

    config = function ()
        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        -- setup dap config by VsCode launch.json file
        local vscode = require("dap.ext.vscode")
        local json = require("plenary.json")

        vscode.json_decode = function(str)
            return vim.json.decode(json.json_strip_comments(str))
        end

        require('dapui').setup({
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.7 },
                        { id = "breakpoints", size = 0.25 },
                        -- { id = "watches", size = 0.1 },
                        { id = "repl", size = 0.05 },
                    },
                    size = 40,
                    position = 'left'
                },
                -- {
                    --     elements = {
                        --         'breakpoints',
                        --         'watches',
                        --         'repl'
                        --     },
                        --     size = 10,
                        --     position = 'bottom'
                        -- }
                    }
                })

                local dap, dapui = require("dap"), require("dapui")
                dap.listeners.before.attach.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.launch.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated.dapui_config = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited.dapui_config = function()
                    dapui.close()
                end
            end
        }
