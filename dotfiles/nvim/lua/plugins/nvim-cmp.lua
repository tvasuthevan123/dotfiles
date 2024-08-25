return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
  },
  opts = function(_, opts)
    opts.formatting = {
      format = require("lspkind").cmp_format({
        before = require("tailwind-tools.cmp").lspkind_format,
      }),
    }
    return opts
  end,
}
