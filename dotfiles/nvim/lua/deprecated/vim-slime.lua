-- vim-slime.lua
-- Bring this back when I know what to use it for (run python in new terminal?)
return {
  "jpalardy/vim-slime",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    vim.g.slime_target = "tmux"
  end,
}
