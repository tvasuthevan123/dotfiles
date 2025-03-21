-- return {
--   {
--     'onsails/lspkind-nvim', -- vscode-like pictograms
--   },
--   {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v4.x',
--     dependencies = {
--       -- LSP Support
--       { 'neovim/nvim-lspconfig' },             -- Required
--       { 'williamboman/mason.nvim' },           -- Optional
--       { 'williamboman/mason-lspconfig.nvim' }, -- Optional
--
--       -- Autocompletion
--       { 'hrsh7th/nvim-cmp' },         -- Required
--       { 'hrsh7th/cmp-nvim-lsp' },     -- Required
--       { 'hrsh7th/cmp-buffer' },       -- Optional
--       { 'hrsh7th/cmp-path' },         -- Optional
--       { 'saadparwaiz1/cmp_luasnip' }, -- Optional
--       { 'hrsh7th/cmp-nvim-lua' },     -- Optional
--
--       -- Snippets
--       { 'L3MON4D3/LuaSnip' },             -- Required
--
--       { 'rafamadriz/friendly-snippets' }, -- Optional
--       { 'ray-x/lsp_signature.nvim' }
--     },
--     config = function()
--       local status, lspkind = pcall(require, "lspkind")
--
--       if (not status) then
--         print("Failed to setup lspzero")
--         return
--       end
--
--       lspkind.init({
--         mode = 'symbol_text',
--
--         -- default symbol map
--         -- can be either 'default' (requires nerd-fonts font) or
--         -- 'codicons' for codicon preset (requires vscode-codicons font)
--         --
--         -- default: 'default'
--         preset = 'codicons',
--
--         -- override preset symbols
--         --
--         -- default: {}
--         symbol_map = {
--           Text = "󰉿",
--           Method = "󰆧",
--           Function = "󰊕",
--           Constructor = "",
--           Field = "󰜢",
--           Variable = "󰀫",
--           Class = "󰠱",
--           Interface = "",
--           Module = "",
--           Property = "󰜢",
--           Unit = "󰑭",
--           Value = "󰎠",
--           Enum = "",
--           Keyword = "󰌋",
--           Snippet = "",
--           Color = "󰏘",
--           File = "󰈙",
--           Reference = "󰈇",
--           Folder = "󰉋",
--           EnumMember = "",
--           Constant = "󰏿",
--           Struct = "󰙅",
--           Event = "",
--           Operator = "󰆕",
--           TypeParameter = "K",
--         },
--       })
--
--
--       -- DEFAULT KEYBINDS
--       --
--       --    K: Displays hover information about the symbol under the cursor
--       --    in a floating window. See :help vim.lsp.buf.hover().
--       --
--       --    gd: Jumps to the definition of the symbol under the cursor.
--       --    See :help vim.lsp.buf.definition().
--       --
--       --    gD: Jumps to the declaration of the symbol under the cursor.
--       --    Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--       --
--       --    gi: Lists all the implementations for the symbol under the cursor in the quickfix window.
--       --    See :help vim.lsp.buf.implementation().
--       --
--       --    go: Jumps to the definition of the type of the symbol under the cursor.
--       --    See :help vim.lsp.buf.type_definition().
--       --
--       --    gr: Lists all the references to the symbol under the cursor in the quickfix window.
--       --    See :help vim.lsp.buf.references().
--       --
--       --    <Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--       --
--       --    <F2>: Renames all references to the symbol under the cursor.
--       --    See :help vim.lsp.buf.rename().
--       --
--       --
--       --    <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
--       --
--       --    gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
--       --
--       --    [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
--       --
--       --    ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
--
--
--       ------------------------------------------------------------------------------------------------------------------
--       ------------------------------------------------------------------------------------------------------------------
--
--       local status, lspzero = pcall(require, "lsp-zero")
--       if (not status) then
--         return
--       end
--
--       local lsp_attach = function(client, bufnr)
--         lspzero.default_keymaps({ buffer = bufnr })
--         -- Open diagnostics
--         vim.keymap.set({ 'n' }, 'gl', function()
--           vim.diagnostic.open_float()
--         end)
--
--         -- Format
--         vim.keymap.set({ 'n', 'x' }, ';gfm', function()
--           vim.lsp.buf.format({ async = true, timeout_ms = 1000, bufnr = bufnr })
--         end)
--       end
--
--
--       lspzero.extend_lspconfig({
--         lsp_attach = lsp_attach,
--         sign_text = true,
--         capabilities = require('cmp_nvim_lsp').default_capabilities()
--       })
--
--
--       lspzero.ui({
--         float_border = 'rounded',
--         sign_text = {
--           error = '✘',
--           warn = '▲',
--           hint = '⚑',
--           info = '»',
--         },
--       })
--
--       -- LSP references
--       lspzero.default_keymaps({ buffer = bufnr })
--       vim.keymap.set('n', 'gtr', '<cmd>Telescope lsp_references<cr>', { buffer = false })
--
--       -- format on save
--       lspzero.format_on_save({
--         servers = {
--           ['lua_ls'] = { 'lua' },
--           ['rust_analyzer'] = { 'rust' },
--           ['gopls'] = { 'go' },
--           ['prettier'] = { 'typescript', 'yaml', 'json' },
--           ['ruff'] = { 'python' },
--         }
--       })
--       -- lspconfig
--       require('mason-lspconfig').setup({
--         ensure_installed = {
--           'rust_analyzer',
--           'eslint',
--           'tailwindcss',
--           'dockerls',
--           'docker_compose_language_service',
--           'pyright',
--           'angularls',
--           'ltex',
--         },
--         handlers = {
--           lspzero.default_setup,
--         }
--       })
--
--       require('mason').setup({
--         ensure_installed = {
--           'prettier'
--         }
--       })
--
--       lspzero.use("pyright", {
--         settings = {
--           python = {
--             analysis = {
--               extraPaths = { ".venv" },
--               autoSearchPaths = false,
--               useLibraryCodeForTypes = true,
--               -- diagnosticMode = 'openFilesOnly',
--               diagnosticMode = 'openFilesOnly',
--             },
--           },
--         },
--         single_file_support = true,
--         flags = {
--           -- debounce_text_changes = 50,
--           debounce_text_changes = 250,
--         },
--         on_attach = function(client, bufnr)
--           print("pyright attached")
--         end
--       })
--
--
--       ------------------------------------------------------------------------------------------------------------------
--       ------------------------------------------------------------------------------------------------------------------
--
--       local status, lspconfig = pcall(require, "lspconfig")
--
--       lspconfig.lua_ls.setup({
--         settings = {
--           Lua = {
--             diagnostics = {
--               globals = { 'vim' }
--             }
--           }
--         }
--       })
--
--       lspconfig.angularls.setup({})
--
--       lspconfig.tailwindcss.setup({})
--
--       local status, cmp = pcall(require, "cmp")
--       if (not status) then
--         return
--       end
--
--
--       require('luasnip.loaders.from_snipmate').lazy_load()
--       require('luasnip.loaders.from_vscode').lazy_load()
--       cmp.setup({
--         sources = {
--           { name = 'path' },
--           { name = 'nvim_lsp' },
--           { name = 'luasnip' },
--         },
--         snippet = {
--           expand = function(args)
--             vim.snippet.expand(args.body)
--           end,
--         },
--         formatting = {
--           -- changing the order of fields so the icon is the first
--           fields = { 'menu', 'abbr', 'kind' },
--           format = lspkind.cmp_format(),
--         },
--         mapping = cmp.mapping.preset.insert({
--           ['<CR>'] = cmp.mapping.confirm({ select = false }),
--           ['<C-Space>'] = cmp.mapping.complete(),
--           ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-u>'] = cmp.mapping.scroll_docs(4),
--         })
--       })
--
--
--       vim.api.nvim_create_autocmd("FileType", {
--         pattern = { "sql", "mysql", "plsql" },
--         callback = function()
--           cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
--         end,
--       })
--
--       local status, lsp_signature = pcall(require, "lsp_signature")
--       if (not status) then return end
--
--       lsp_signature.setup({
--         bind = true, -- This is mandatory, otherwise border config won't get registered.
--         handler_opts = {
--           border = "single",
--         },
--         always_trigger = true, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
--         toggle_key = '<C-s>',  -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
--         timer_interval = 100,
--         transparency = 100,
--         hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
--       })
--
--       -- Ensures that the treesitter tockens priority is higher than then
--       -- lsp priority otherwise it will generate this jarring color changing effectV
--       vim.highlight.priorities.semantic_tokens = 95
--     end
--   },
--   {
--     'williamboman/mason-lspconfig.nvim',
--   },
--   {
--     'williamboman/mason.nvim',
--     opts = {
--       ui = {
--         border = "single",
--         icons = {
--           package_installed = "✓",
--           package_pending = "➜",
--           package_uninstalled = "✗"
--         }
--       }
--     }
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     -- follow latest release.
--     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--     -- install jsregexp (optional!)
--     build = "make install_jsregexp",
--     config = function()
--       local ls = require('luasnip')
--
--       for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/lima_the_lime/snips/ft/*.lua", true)) do
--         loadfile(ft_path)()
--       end
--
--       vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
--       vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
--       vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
--
--       vim.keymap.set({ "i", "s" }, "<C-E>", function()
--         if ls.choice_active() then
--           ls.change_choice(1)
--         end
--       end, { silent = true })
--     end,
--   }
-- }

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })

      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      -- { "" },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = "yes"
    end,
    config = function()
      local lsp_defaults = require("lspconfig").util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities =
        vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          -- local builtin = require('telescope.builtin')
          -- local actions = require('telescope.actions')

          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })

      -- Cos Angular just had to be a PITA

      vim.filetype.add({
        pattern = {
          [".*%.component%.html"] = "htmlangular", -- sets the filetype to `angular.html` if it matches the pattern
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "eslint",
          "tailwindcss",
          "dockerls",
          "docker_compose_language_service",
          "pyright",
          "angularls",
          "ltex",
          "marksman",
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Godot setup
      local port = "65534"
      local cmd = vim.lsp.rpc.connect("172.30.0.1", port)
      require("lspconfig").gdscript.setup({
        cmd = cmd,
        on_attach = function(client, bufnr)
          print("gdscript attached")
        end,
        filetypes = { "gdscript" },
        root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, {
          upward = true,
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        })[1]),
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff", "black", stop_after_first = true },
        javascript = { "prettier" },
        typescript = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
        gdscript = { "gdformat" },
        markdown = { "markdownlint-cli2", "markdown-toc" },
      },
      -- Conform will notify you when a formatter errors
      notify_on_error = true,
      -- Conform will notify you when no formatters are available for the buffer
      notify_no_formatters = true,
    },
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            -- background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
        },
      })
    end,
  },
}
