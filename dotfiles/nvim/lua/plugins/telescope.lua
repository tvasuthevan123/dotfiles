-- return {
--   "nvim-telescope/telescope.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     local actions = require("telescope.actions")
--     require("telescope").setup({
--       defaults = {
--         -- Other default configurations
--         mappings = {
--           i = {
--             ["<c-p>"] = require("telescope.actions.layout").toggle_preview,
--             ["<s-up>"] = actions.cycle_history_prev,
--             ["<s-down>"] = actions.cycle_history_next,
--           },
--         },
--       },
--       pickers = {
--         find_files = {
--           theme = "dropdown",
--           hidden = true,
--           find_command = {
--             "rg",
--             "--files",
--             "--color",
--             "never",
--             "--ignore-file",
--           },
--         },
--         live_grep = {},
--       },
--       extensions = {
--         -- Extension configurations
--       },
--     })
--   end,
--   init = function()
--     require("cmp").register_source({
--       name = "telescope_commands",
--       new_entries = function(_, _, _, callback)
--         local pickers = {
--           "commands", -- Use the commands picker from telescope.nvim
--         }
--
--         telescope.builtin.commands({}, {}, function(prompt_id, result)
--           if result then
--             callback(result)
--           end
--         end)
--       end,
--     })
--   end,
-- }

return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    local function telescope_buffer_dir()
      return vim.fn.expand("%:p:h")
    end

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
      },
    })

    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<leader>sf", function()
      builtin.find_files({
        no_ignore = false,
        hidden = true,
        path_display = { "filename_first" },
        file_ignore_patterns = { "node_modules", ".git/", ".venv", "node_modules" },
        mappings = {
          ["r"] = fb_actions.rename,
        },
      })
    end)
    vim.keymap.set("n", "<leader>sF", function()
      builtin.find_files({
        no_ignore = false,
        hidden = true,
        respect_gitignore = false,
        file_ignore_patterns = {},
        path_display = { "filename_first" },
        mappings = {
          ["r"] = fb_actions.rename,
        },
      })
    end)
    vim.keymap.set("n", "<leader>sg", function()
      builtin.live_grep({
        no_ignore = false,
        hidden = true,
        file_ignore_patterns = { ".git/", "package-lock.json", "**/package-lock.json", "**/poetry.lock", "**/*.svg" },
      })
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
    vim.keymap.set("n", "<leader><leader>", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end)
  end,
}
