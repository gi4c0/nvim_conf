return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    {'nvim-telescope/telescope-file-browser.nvim'}
  },

  keys = {
    {"<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>",noremap = true, silent = true},
    {"<leader>/", "<cmd>lua require('telescope.builtin').live_grep()<cr>",noremap = true, silent = true},
    {"<C-Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>",noremap = true, silent = true},
    {"<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>",noremap = true, silent = true},
    -- keymap("n", "gr", ":Telescope lsp_references<cr>", options)

    {"<leader>ghh", "<cmd>lua require('telescope.builtin').git_commits()<cr>", noremap = true, silent = true},
    {"<leader>ghb", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", noremap = true, silent = true},

    {"<C-f>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap = true, silent = true}
  },

  init = function()
    require("telescope").load_extension "file_browser"
  end,

  opts = function ()
    local actions = require('telescope.actions')

    return {
      defaults = {
        file_ignore_patterns = {"%.git/*"},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {

          }
        },

      },
      pickers = {
        find_files = {
          previewer = false,
        },
        buffers = {
          -- theme = "dropdown",
          sort_lastused = true,
          previewer = false,
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
            }
          }
        }
      },
      extensions = {
        file_browser = {
          previewer = false,
          -- theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        }
      }
    }

  end
}
