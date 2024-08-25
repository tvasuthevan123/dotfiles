-- vim-slime.lua
return {
  "jpalardy/vim-slime",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    vim.g.slime_target = "tmux"
  end,
}
