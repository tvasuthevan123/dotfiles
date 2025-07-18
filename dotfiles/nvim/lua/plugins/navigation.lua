return {
  -- Search (files and expressions)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.load_extension("file_browser")
      telescope.load_extension("live_grep_args")

      local fb_actions = require("telescope").extensions.file_browser.actions
      telescope.setup({
        defaults = {
          wrap_results = true,
          prompt_prefix = "Search 🔍  ",
          mappings = {
            n = {
              ["q"] = actions.close,
            },
            i = {
              ["<c-p>"] = require("telescope.actions.layout").toggle_preview,
              ["<s-up>"] = actions.cycle_history_prev,
              ["<s-down>"] = actions.cycle_history_next,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        },
        extensions = {
          file_browser = {
            -- theme = "dropdown",
            prompt_prefix = "'N' to create a file? Or search 🔍  ",
            hidden = true,
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              -- your custom insert mode mappings
              ["i"] = {
                ["<C-w>"] = function()
                  vim.cmd("normal vbd")
                end,
              },
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["h"] = fb_actions.goto_parent_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
              },
            },
          },
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-f>"] = lga_actions.quote_prompt(),
                -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-u>"] = actions.to_fuzzy_refine,
              },
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>sf", function()
        builtin.find_files({
          cwd = "./",
          no_ignore = false,
          hidden = true,
          respect_gitignore = false,
          path_display = { "filename_first" },
          file_ignore_patterns = { "node_modules", ".git/", ".venv", "node_modules" },
          mappings = {
            ["r"] = fb_actions.rename,
          },
        })
      end)
      vim.keymap.set("n", "<leader>sg", function()
        telescope.extensions.live_grep_args.live_grep_args({
          no_ignore = false,
          hidden = true,
          file_ignore_patterns = { ".git/", "package-lock.json", "**/package-lock.json", "**/poetry.lock", "**/*.svg" },
        })
      end)
      vim.keymap.set("n", "<leader>sF", function()
        builtin.find_files({
          cwd = vim.fn.expand("%:h"),
          no_ignore = false,
          hidden = true,
          respect_gitignore = false,
          path_display = { "filename_first" },
          file_ignore_patterns = { "node_modules", ".git/", ".venv", "node_modules" },
          mappings = {
            ["r"] = fb_actions.rename,
          },
        })
      end)
      vim.keymap.set("n", "<leader>st", function()
        builtin.treesitter()
      end)
      vim.keymap.set("n", "<leader>s\\", function()
        builtin.buffers()
      end)
      vim.keymap.set("n", "<leader>sq", function()
        builtin.quickfix()
      end)
      vim.keymap.set("n", "<leader>ss", function()
        builtin.resume()
      end)
      vim.keymap.set("n", "<leader>sR", function()
        builtin.lsp_references()
      end)
      vim.keymap.set("n", "<leader>sr", function()
        builtin.lsp_document_symbols({ symbols = { "method", "class", "function" } })
      end)
      vim.keymap.set("n", "<leader>sy", function()
        builtin.treesitter()
      end)
      vim.keymap.set("n", "<leader>sc", function()
        builtin.git_commits()
      end)
      vim.keymap.set("n", "<leader>sE", function()
        builtin.diagnostics({ severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN } })
      end)
      vim.keymap.set("n", "<leader>sd", function()
        builtin.diagnostics()
      end)
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  -- Search and replace
  {
    "MagicDuck/grug-far.nvim",
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require("grug-far").setup({
        -- options, see Configuration section below
        -- there are no required options atm
      })
    end,
  },

  -- Oil browser
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          winbar = "%{v:lua.require('oil').get_current_dir()}",
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["q"] = "actions.close",
        },
      })
    end,
  },
}
