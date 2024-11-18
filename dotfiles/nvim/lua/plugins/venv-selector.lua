-- return {
--   "linux-cultist/venv-selector.nvim",
--   cmd = "VenvSelect",
--   opts = function(_, opts)
--     if require("config.helpers").has("nvim-dap-python") then
--       opts.dap_enabled = true
--     end
--     return vim.tbl_deep_extend("force", opts, {
--       name = {
--         "venv",
--         ".venv",
--         "env",
--         ".env",
--       },
--     })
--   end,
--   keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
-- }
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python",   --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  stay_on_this_version = true,
  config = function()
    require("venv-selector").setup()
  end,
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>" },
  },
}
