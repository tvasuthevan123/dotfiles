return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
    "L3MON4D3/LuaSnip",
  },
  opts = function(_, opts)
    cmp = require("cmp")

    opts.formatting = {
      format = require("lspkind").cmp_format({
        before = require("tailwind-tools.cmp").lspkind_format,
      }),
    }

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    -- opts.mapping = {
    --   ["<CR>"] = cmp.mapping.confirm({ select = false }),
    -- }

    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }
    table.insert(opts.sources, { name = "luasnip" })
    return opts
  end,
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<tab>",
      function()
        require("luasnip").jump(1)
      end,
      mode = "s",
    },
    {
      "<s-tab>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
    },
  },
}
