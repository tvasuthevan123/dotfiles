return {
  -- Cursor-style chat
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = "make BUILD_FROM_SOURCE=true",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      auto_suggestions_provider = "gemini",
      cursor_applying_provider = "gemini",
      behaviour = {
        enable_token_counting = false,
        auto_suggestions = true, -- Experimental stage
        enable_cursor_planning_mode = true,
      },
      mappings = {
        suggestion = {
          accept = "<C-s>",
          next = "<C-\\>",
          prev = "<C-'>",
          dismiss = "<C-q>",
        },
      },
      provider = "gemini",
      providers = {
        gemini = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-2.0-flash-lite",
          timeout = 10000, -- Timeout in milliseconds
          temperature = 0,
          max_tokens = 2048,
        },
        gemini_flash = {
          __inherited_from = "gemini",
          model = "gemini-2.5-flash",
          max_tokens = 8096,
        },
        gemini_pro = {
          __inherited_from = "gemini",
          model = "gemini-2.5-pro",
          max_tokens = 8096,
        },
      },
      todos = {}, -- Explicitly initialize todos as an empty table
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

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
