return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    autopairs.setup{}

    autopairs.add_rules {
      Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts) return opts.char == ">" end),
      Rule("|", "|"):with_pair(cond.before_regex("%(+")):with_move(function(opts) return opts.char == "|" end),
      Rule(' ', ' '):with_pair(function (opts)
        local pair = opts.line:sub(opts.col, opts.col+1)   -- change to +1
        return vim.tbl_contains({')', ']', '}'}, pair)
      end)
    }

  end
}
