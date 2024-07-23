return {
  'ibhagwan/fzf-lua',
  enabled = true,
  lazy = false,

  dependencies = {
    { "junegunn/fzf", build = "./install --bin" }
  },

  config = function ()
    local config = require("fzf-lua.config")
    local actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-t"] = actions.open

    require("fzf-lua").setup({
      'telescope',
      fzf_opts   = { ["--layout"] = "default", ["--marker"] = "+" },
      winopts    = {
        width   = 0.8,
        height  = 0.9,
        preview = {
          hidden       = "hidden",
          vertical     = "up:45%",
          horizontal   = "right:50%",
          layout       = "flex",
          flip_columns = 120,
        },
      },
    })
  end,

  keys = {
    {'<C-p>', "<cmd>lua require('fzf-lua').files()<CR>", silent = true},
    {'<leader>fR', ":FzfLua files resume=true<CR>", silent = true, desc = "Resume on file search"},
    -- {'<leader>fr', ':FzfLua oldfiles<CR>', noremap = true, silent = true, "Recent files" },
    {'<leader>gB', ':FzfLua git_branches<CR>', noremap = true, silent = true, "Git branches" },
    {'<C-Space>', "<cmd>lua require('fzf-lua').buffers()<CR>", silent = true},
    {'<leader>/', ":FzfLua live_grep<CR>", silent = true},
    {'<leader>*', ":FzfLua live_grep<CR>", silent = true},
    {'<leader>ss', ":FzfLua grep<CR>", silent = true},
    {'<leader>sl', ":FzfLua grep_last<CR>", silent = true},
  }
}
