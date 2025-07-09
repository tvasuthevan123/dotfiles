-- File: mini.lua
-- A minimal configuration to test LSP semantic highlighting

-- Set up a temporary package path
local path = vim.fn.stdpath("data") .. "/site"
vim.o.packpath = path

-- Bootstrap a minimal package manager (lazy.nvim)
local lazypath = path .. "/pack/lazy/start/lazy.nvim/lua/lazy"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    path .. "/pack/lazy/start/lazy.nvim",
  })
end
require("lazy")

-- Set up plugins
require("lazy").setup({
  -- Provide a list plugin configurations here, e.g.
  -- {
  --    "lewis6991/gitsigns.nvim",
  --    config = ...
  -- },
})

-- Set the colorscheme (needs to be installed as a plugin first)
vim.cmd.colorscheme("")
