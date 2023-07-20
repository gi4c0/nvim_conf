return {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = true,
        keys = {
          { "<leader>dt", require('dapui').toggle, noremap = true, silent = true }
        }
      },

      {
         "ldelossa/nvim-dap-projects",
         init = function()
           require("nvim-dap-projects").search_project_config()
         end
      },

      { "leoluz/nvim-dap-go" },
      { "nvim-telescope/telescope-dap.nvim" },

      {
         "theHamsta/nvim-dap-virtual-text",
         config = true
      },

      -- Languages
      {
         "mxsdev/nvim-dap-vscode-js",
         config = function()
           local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"

           require("dap-vscode-js").setup {
             node_path = "node",
             debugger_path = DEBUGGER_PATH,
             -- debugger_cmd = { "js-debug-adapter" },
             adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
           }

           for _, language in ipairs { "typescript", "javascript" } do
             require("dap").configurations[language] = {
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
               {
                 type = "pwa-node",
                 request = "launch",
                 name = "Debug Jest Tests",
                 -- trace = true, -- include debugger info
                 runtimeExecutable = "node",
                 runtimeArgs = {
                   "./node_modules/jest/bin/jest.js",
                   "--runInBand",
                 },
                 rootPath = "${workspaceFolder}",
                 cwd = "${workspaceFolder}",
                 console = "integratedTerminal",
                 internalConsoleOptions = "neverOpen",
               },
             }
           end
         end
       },
       {
         "microsoft/vscode-js-debug",
         lazy = true,
         build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
       },
     },

     keys = {
       { "<leader>db", ":DapToggleBreakpoint<CR>", noremap = true, silent = true },
       { "<leader>dc", ":DapContinue<CR>", noremap = true, silent = true },
       { "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", noremap = true, silent = true },
     }
   }

