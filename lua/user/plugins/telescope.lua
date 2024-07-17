return {
  'nvim-telescope/telescope.nvim',
  lazy = false,

  dependencies = {
    {'nvim-telescope/telescope-file-browser.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'molecule-man/telescope-menufacture'},
    {'nvim-telescope/telescope-frecency.nvim'},
    {
      'aaronhallaert/advanced-git-search.nvim',
      dependencies = {
        'tpope/vim-rhubarb'
      }
    }
  },

  config = function()
    local actions = require('telescope.actions')
    local open_with_trouble = require("trouble.sources.telescope").open
    local add_to_trouble = require("trouble.sources.telescope").add

    require("telescope").setup {
      defaults = {
        respect_gitignore = false,
        file_ignore_patterns = {"^.git/"},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-t>"] = open_with_trouble,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-p>"] = require('telescope.actions.layout').toggle_preview
          },
          n = {
            ["<C-t>"] = open_with_trouble
          }
        },

      },
      pickers = {
        find_files = {
          previewer = false,
          path_display = { "absolute" }
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
        -- advanced_git_search = {
        --   -- See Config
        -- },
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        file_browser = {
          respect_gitignore = false,
          file_ignore_patterns = {".git/*"},
          previewer = false,
          grouped = true,
          hidden = true,
          select_buffer = true,
          display_stat = false,
          theme = "dropdown",
          layout_config = {
            height = .75,
          },
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

    require("telescope").load_extension "fzf"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "menufacture"
    -- require("telescope").load_extension "advanced_git_search"
    require("telescope").load_extension "frecency"
  end,

  keys = {
    -- {"<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>",noremap = true, silent = true},
    {"<leader>fr", ':Telescope frecency workspace=CWD path_display={"shorten"} them=ivy<CR>',noremap = true, silent = true},
    {"<leader>/", ":lua require('telescope').extensions.menufacture.live_grep()<CR>",noremap = true, silent = true, desc = "Telescope live grep"}, -- use <C-^> to open a menu
    -- {"<C-Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>",noremap = true, silent = true},
    -- {"<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>",noremap = true, silent = true},

    {"<leader>hh", ":Telescope help_tags<CR>", silent = true, desc = "Seach on help tags"},
    {"<leader>r", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap = true, silent = true, desc = "File browser"},
    {"<C-f>", ":Telescope file_browser files=false respect_gitignore=true<CR>", noremap = true, silent = true, desc = "Search by folder"},
  },

}
