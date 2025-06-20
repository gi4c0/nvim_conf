return {
    'mfussenegger/nvim-dap',
    lazy = false,
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
    },

    keys = {
        { '<leader>d<space>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' } },
        { '<leader>dl', function() require('dap').step_over() end, { desc = 'Debug: Step Over' } },
        { '<leader>dj', function() require('dap').step_into() end, { desc = 'Debug: Step Into' } },
        { '<leader>dk', function() require('dap').step_out() end, { desc = 'Debug: Step Out' } },
        { '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' } },
        { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Set Conditional Breakpoint' } },
        { '<leader>dt', function() require('dap').terminate() end, { desc = 'Debug: Terminate' } },
        { '<leader>dd', function() require('dapui').toggle() end, { desc = 'Debug: Toggle UI' } },
        { '<leader>de', function() require('dapui').eval() end, { desc = 'Debug: Evaluate Expression' }, mode = {'n', 'v'} },
    },

    config = function ()
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
