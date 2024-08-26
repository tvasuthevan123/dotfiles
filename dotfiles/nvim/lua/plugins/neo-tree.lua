return {
  "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  opts = {
    filesystem = {
      bind_to_cwd = true,
      follow_current_files = true,
      filtered_items = {
	visible = true,
	show_hidden_count = true,
	hide_dotfiles = false,
	hide_gitignore = false,
      }
    },
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
  },
}
