-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = " "
require("config.keymaps")
require("config.autocmds")
require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

-- This line will inject anything in
-- ~/.config/nvim/lua/plugins.lua or ~/.config/nvim/lua/plugins/init.lua (this file is optional)
-- but also load all the plugins in
-- ~/.config/nvim/lua/plugins/*.lua
lazy.setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
  rocks = {
    enabled = false,
  },
})
