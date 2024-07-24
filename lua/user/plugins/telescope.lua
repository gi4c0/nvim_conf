return {
  'nvim-telescope/telescope.nvim',
  lazy = false,

  dependencies = {
    {
        'nvim-telescope/telescope-file-browser.nvim',
        build = 'brew install fd', -- Needed for faster directories loading. Alternative to find
        keys = {
          -- {"<leader>r", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap = true, silent = true, desc = "File browser (from file)"},
          -- {"<leader>R", ":Telescope file_browser<CR>", noremap = true, silent = true, desc = "File browser (from root)"},
        }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- enabled = false,
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {'molecule-man/telescope-menufacture'},
    {'nvim-telescope/telescope-live-grep-args.nvim'},
    {
      'aaronhallaert/advanced-git-search.nvim',
      dependencies = {
        'tpope/vim-rhubarb'
      }
    },
    {
        "mikavilpas/yazi.nvim",
        -- event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {"<leader>r", function() require("yazi").yazi() end, desc = "Open the file manager"},
            -- Open in the current working directory
            { "<leader>R", function() require("yazi").yazi(nil, vim.fn.getcwd()) end, desc = "Open the file manager in nvim's working directory" },
            -- NOTE: requires a version of yazi that includes
            -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
            {'<c-up>', function() require('yazi').toggle() end, desc = "Resume the last yazi session" },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = true,

            -- enable these if you are using the latest version of yazi
            use_ya_for_events_reading = true,
            -- use_yazi_client_id_flag = true,
            keymaps = {
                open_file_in_vertical_split = '<c-v>',
                open_file_in_horizontal_split = '<c-s>',
                open_file_in_tab = '<c-t>',
                grep_in_directory = '<c-g>',
                replace_in_directory = '<c-x>',
                cycle_open_buffers = '<tab>',
            },
        },
    }
  },

  config = function()
    local actions = require('telescope.actions')
    local open_with_trouble = require("trouble.sources.telescope").open
    local yazi = require("yazi")

    local action_state = require('telescope.actions.state')

    local function open_in_yazi(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
            local dir_path = selection.path or selection[1]
            yazi.yazi(nil, dir_path)
        end

    end

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
          -- file_ignore_patterns = {".git/*"},
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
          hijack_netrw = false,
          mappings = {
            ["i"] = {
                ["<CR>"] = open_in_yazi
            },
            ["n"] = {
                ["<CR>"] = open_in_yazi
            },
          },
        }
      }
    }

    require("telescope").load_extension "fzf"
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "menufacture"
    require("telescope").load_extension "live_grep_args"
  end,

  keys = {
    -- {"<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>",noremap = true, silent = true},
    {"<leader>/", ":lua require('telescope').extensions.menufacture.live_grep()<CR>",noremap = true, silent = true, desc = "Telescope live grep"}, -- use <C-^> to open a menu
    {"<leader>?", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", noremap = true, silent = true, desc = "Telescope grep ('query' -g **/path/*file*)"},
    -- {"<C-Space>", "<cmd>lua require('telescope.builtin').buffers()<cr>",noremap = true, silent = true},
    {"<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>",noremap = true, silent = true},

    {"<leader>hh", ":Telescope help_tags<CR>", silent = true, desc = "Seach on help tags"},
    {"<C-f>", ":Telescope file_browser files=false respect_gitignore=true<CR>", noremap = true, silent = true, desc = "Search by folder"},
    { "gr", ":Telescope lsp_references<cr>",noremap = true, silent = true, desc = "Show LSP references" },
    {"gt", "<cmd>Telescope lsp_type_definitions<CR>", silent = true, noremap = true, desc = "Show LSP type definitions"},
    -- {"<leader>li", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP Implementations"},
    -- {"<leader>el", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics"},
  },

}

