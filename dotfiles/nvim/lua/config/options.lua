-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any addit

vim.opt.number = true
vim.opt.relativenumber = false

vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular", -- sets the filetype to `angular.html` if it matches the pattern
  },
})

vim.opt.autochdir = true
