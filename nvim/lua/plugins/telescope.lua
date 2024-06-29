return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- Other default configurations
      },
      pickers = {
        -- Custom configurations for builtin pickers
      },
      extensions = {
        -- Extension configurations
      },
    })
  end,
  init = function()
    require("cmp").register_source({
      name = "telescope_commands",
      new_entries = function(_, _, _, callback)
        local pickers = {
          "commands", -- Use the commands picker from telescope.nvim
        }

        telescope.builtin.commands({}, {}, function(prompt_id, result)
          if result then
            callback(result)
          end
        end)
      end,
    })
  end,
}
