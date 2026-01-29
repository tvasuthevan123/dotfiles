return {
  -- Cursor-style chat
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = "make BUILD_FROM_SOURCE=true",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     auto_suggestions_provider = "gemini",
  --     cursor_applying_provider = "gemini",
  --     behaviour = {
  --       enable_token_counting = false,
  --       auto_suggestions = true, -- Experimental stage
  --       enable_cursor_planning_mode = true,
  --     },
  --     mappings = {
  --       suggestion = {
  --         accept = "<C-s>",
  --         next = "<C-\\>",
  --         prev = "<C-'>",
  --         dismiss = "<C-q>",
  --       },
  --     },
  --     provider = "gemini",
  --     providers = {
  --       gemini = {
  --         endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
  --         model = "gemini-2.0-flash-lite",
  --         timeout = 10000, -- Timeout in milliseconds
  --         temperature = 0,
  --         max_tokens = 2048,
  --       },
  --       gemini_flash = {
  --         __inherited_from = "gemini",
  --         model = "gemini-2.5-flash",
  --         max_tokens = 8096,
  --       },
  --       gemini_pro = {
  --         __inherited_from = "gemini",
  --         model = "gemini-2.5-pro",
  --         max_tokens = 8096,
  --       },
  --     },
  --     todos = {}, -- Explicitly initialize todos as an empty table
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  -- MCP Setup
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "./bundled_build.lua",
    config = function()
      require("mcphub").setup({
        use_bundled_binary = true, -- Use local `mcp-hub` binary
      })
    end,
  },

  -- CLI Coding Agent
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "ooc", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode…" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "aro", function()
        return require("opencode").operator("@this ")
      end, { desc = "Add range to opencode", expr = true })
      vim.keymap.set("n", "alo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Add line to opencode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll opencode up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll opencode down" })

      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
      vim.keymap.set("n", "<C-+>", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "<C-->", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  },

  -- -- Inline code suggestions
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   config = function()
  --     require("minuet").setup({
  --       provider = "gemini",
  --       provider_options = {
  --         optional = {
  --           generationConfig = {
  --             maxOutputTokens = 256,
  --             -- When using `gemini-2.5-flash`, it is recommended to entirely
  --             -- disable thinking for faster completion retrieval.
  --             thinkingConfig = {
  --               thinkingBudget = 0,
  --             },
  --           },
  --           safetySettings = {
  --             {
  --               category = "HARM_CATEGORY_DANGEROUS_CONTENT",
  --               threshold = "BLOCK_ONLY_HIGH",
  --             },
  --           },
  --         },
  --       },
  --       virtualtext = {
  --         auto_trigger_ft = {},
  --         keymap = {
  --           -- accept whole completion
  --           accept = "<A-a>",
  --           -- accept one line
  --           accept_line = "<A-l>",
  --           -- accept n lines (prompts for number)
  --           -- e.g. "A-z 2 CR" will accept 2 lines
  --           accept_n_lines = "<A-n>",
  --           -- Cycle to prev completion item, or manually invoke completion
  --           prev = "<A-up>",
  --           -- Cycle to next completion item, or manually invoke completion
  --           next = "<A-down>",
  --           dismiss = "<A-q>",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
