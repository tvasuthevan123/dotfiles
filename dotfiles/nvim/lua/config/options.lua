-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any addit

vim.opt.number = true
vim.opt.relativenumber = false

-- vim.filetype.add({
--   pattern = {
--     [".*%.component%.html"] = "htmlangular", -- sets the filetype to `angular.html` if it matches the pattern
--   },
-- })

vim.opt.autochdir = true
vim.opt.termguicolors = true

-- vim.wo.fillchars='eob: '
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically

