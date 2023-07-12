-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local actions = require('telescope.actions')
local telescope = require "telescope"

telescope.setup{
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

telescope.load_extension "file_browser"

keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>", options)
keymap("n", "<leader>/", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<C-Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
-- keymap("n", "gr", ":Telescope lsp_references<cr>", options)

keymap("n", "<leader>ghh", "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
keymap("n", "<leader>ghb", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", options)

keymap("n", "<C-f>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true, silent = true })
