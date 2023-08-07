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

      {
         "leoluz/nvim-dap-go",
         config = true
      },
      { "nvim-telescope/telescope-dap.nvim" },

      {
         "theHamsta/nvim-dap-virtual-text",
         config = true
      },
     },
     keys = {
       { "<leader>db", ":DapToggleBreakpoint<CR>", noremap = true, silent = true },
       { "<leader>dc", ":DapContinue<CR>", noremap = true, silent = true },
       { "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", noremap = true, silent = true },
     }
   }

