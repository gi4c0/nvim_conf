return {
  {
    'sindrets/diffview.nvim',
    cmd = {'DiffviewOpen'},
    keys = {
      {"<leader>gD", ":DiffviewFileHistory %<CR>", desc = "Show file history", silent = true, mode = {"n"}},
      {"<leader>gD", ":DiffviewFileHistory<CR>", desc = "Show selected chunk history", silent = true, mode = {"v"}}
    }
  },

  {
    'polarmutex/git-worktree.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
         'nvim-telescope/telescope.nvim',
         version = '^2',
         config = function()
           require("telescope").load_extension("git_worktree")
         end
      }
    },

    config = function()
      local Hooks = require("git-worktree.hooks")
      local buffer_store = {}

      -- Function to save buffer information
      local function save_buffers(worktree_path)
          local buffers = vim.api.nvim_list_bufs()
          local buffer_info = {}

          for _, buf in ipairs(buffers) do
              if vim.api.nvim_buf_is_loaded(buf) then
                  local buf_name = vim.api.nvim_buf_get_name(buf)
                  if buf_name ~= '' then
                      local cursor_pos = vim.api.nvim_buf_get_mark(buf, '"')
                      table.insert(buffer_info, { name = buf_name, cursor = cursor_pos })
                  end
              end
          end

          buffer_store[worktree_path] = buffer_info
      end

      -- Function to restore buffer information
      local function restore_buffers(worktree_path)
          local buffer_info = buffer_store[worktree_path]
          if buffer_info then
              for _, info in ipairs(buffer_info) do
                  vim.cmd('e ' .. info.name)
                  vim.api.nvim_win_set_cursor(0, info.cursor)
              end
          end
      end

      Hooks.register(Hooks.type.SWITCH, function(new_path, prev_path)
          -- Save buffers for the previous worktree path
          if prev_path then
              save_buffers(prev_path)
          end

          -- Clear current buffers
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) then
                  vim.api.nvim_buf_delete(buf, { force = false })
              end
          end

          -- Restore buffers for the new worktree path
          if new_path then
              restore_buffers(new_path)
          end
      end)

      ---@type GitWorktreeConfig
      vim.g.git_worktree = {
        change_directory_command = 'cd',
        update_on_change = true,
        update_on_change_command = 'e .',
        clearjumps_on_change = true,
        confirm_telescope_deletions = true,
        autopush = false,
      }
    end,

    keys = {
      {'<leader>gw', function() require('telescope').extensions.git_worktree.git_worktree() end, desc = "Git Worktree"},
      {'<leader>gW', function() require('telescope').extensions.git_worktree.create_git_worktree() end, desc = "Create Git Worktree"}
    }

  },

  -- {
  --   'kdheepak/lazygit.nvim',
  --   enabled = true,
  --   keys = {
  --       {"<leader>gg", ":LazyGit<cr>", noremap = true, silent = true, desc = "Lazy Git" },
  --   },
  --   config = function()
  --       -- vim.g.lazygit_floating_window_winblend = 1
  --       vim.g.lazygit_floating_window_scaling_factor = 0.9
  --       vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╰", "╯" }
  --   end
  -- },

  {
    'lewis6991/gitsigns.nvim',
    config = true,
    lazy = false,
    keys = {
      {"<leader>gd", ":Gitsigns preview_hunk<CR>", desc = "Difference hunk preview", silent = true},
      {
        ']g',
        function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            require('gitsigns').nav_hunk('next')
          end
        end,
        silent = true,
        desc = "Next git chunk"
      },

      {
        '[g',
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            require('gitsigns').nav_hunk('prev')
          end
        end,
        silent = true,
        desc = "Next git chunk"
      }
    }
  },

  {
    'tpope/vim-fugitive',
    enabled = true,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "git",
        callback = function()
          vim.opt_local.foldmethod = "syntax" -- Need this to automatically fold file changes in git object
        end
      })
    end,
    dependencies = {
      { -- pretty git log
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        keys = {
          {'<leader>gf', ':Flog -path=', noremap = true, silent = true, desc = "Git flog for path" },
          {"<leader>gl", ":Flogsplit -path=%<CR>", noremap = true, silent = true, desc = "Git log of current file" },
          {"<leader>gL", ":Flogsplit<CR>", noremap = true, silent = true, desc = "Git log of repository file" },
        }
      },
    },

    keys = {
      {"<leader>gs", ":vertical :Git<CR>", noremap = true, silent = true, desc = "Git status" },
      {"<leader>gS", ":vertical :Git<CR><C-w>o", noremap = true, silent = true, desc = "Git status (full screen)" },
      {"<leader>gb", ":Git blame<CR>", noremap = true, silent = true, desc = "Git blame" },
      {"<leader>gc", ":Gvsplit :%<left><left>", noremap = true, silent = true, desc = "Show git file on given commit/branch" },
      {">", "zo", desc = "Open fold", ft="git" },
      {"<", "zc", desc = "Close fold", ft="git" },
      {"<TAB>", "za", desc = "Toggle fold", ft="git" },
    }
  },
}
