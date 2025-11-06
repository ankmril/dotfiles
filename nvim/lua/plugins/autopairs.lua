return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true, -- Treesitter-aware
      enable_check_bracket_line = true,
      fast_wrap = {},
    })

    -- Add custom rule for { ... }
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.add_rules({
      Rule("{", "}\n", { "lua", "javascript", "typescript", "rust", "c", "cpp" })
        :set_end_pair_length(2)
        :with_move(cond.none())
        :with_pair(function() return true end)
        :with_cr(function()
          return true
        end)
        :set_replace_endpair(function(opts)
          -- insert newline, indent, and closing brace
          return "\n    \n}"
        end),
    })
  end,
}