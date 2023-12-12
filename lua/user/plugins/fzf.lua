return {
  'ibhagwan/fzf-lua',

  dependencies = {
    { "junegunn/fzf", build = "./install --bin" }
  },

  config = function ()
    require("fzf-lua").setup({
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
    {'<leader>fr', ":FzfLua files resume=true<CR>", silent = true},
    {'<leader>fR', ':FzfLua oldfiles<CR>', noremap = true, silent = true },
    {'<C-Space>', "<cmd>lua require('fzf-lua').buffers()<CR>", silent = true},
    -- {'<leader>/', ":FzfLua live_grep<CR>", silent = true},
    {'<leader>ss', ":FzfLua grep<CR>", silent = true},
    {'<leader>sl', ":FzfLua grep_last<CR>", silent = true},
  }
}
