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
vim.opt.smartcase = true   -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true                                      -- Confirm to save changes before exiting modified buffer
opt.cursorline = true                                   -- Enable highlighting of the current line
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit"                    -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3                            -- global statusline
opt.linebreak = true                          -- Wrap lines at convenient points
opt.list = true                               -- Show some invisible characters (tabs...
opt.mouse = "a"                               -- Enable mouse mode
opt.number = true                             -- Print line number
opt.pumblend = 10                             -- Popup blend
opt.pumheight = 10                            -- Maximum number of entries in a popup
opt.ruler = false                             -- Disable the default ruler
opt.scrolloff = 4                             -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true                         -- Round indent
opt.shiftwidth = 2                            -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false                          -- Dont show mode since we have a statusline
opt.sidescrolloff = 8                         -- Columns of context
opt.signcolumn = "yes"                        -- Always show the signcolumn, otherwise it would shift the text each time
opt.spelllang = { "en" }
opt.splitbelow = true                         -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true                         -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 2                               -- Number of spaces tabs count for
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap
vim.g.markdown_recommended_style = 0
