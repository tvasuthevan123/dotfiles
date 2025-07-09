-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.maplocalleader = ","

local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
-- Split window
keymap.set("n", "sh", ":split<Return>")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", "§", "<C-w>w")
keymap.set("n", "`", "<C-w>w")
keymap.set("n", "\\", "<C-w>w")
keymap.set("", "Sh", "<C-w>h")
keymap.set("", "Sk", "<C-w>k")
keymap.set("", "Sj", "<C-w>j")
keymap.set("", "Sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Honestly, idk
keymap.set("t", "<C-Space>", "<C-\\><C-n><C-w>h", { silent = true })

-- Current buffer absolute path
vim.api.nvim_set_keymap(
  "n",
  "<leader>ap",
  ':lua vim.fn.system("echo ".. vim.fn.expand("%:p").. "|pbcopy")<CR>',
  { noremap = true }
)

-- Current buffer relative path
vim.api.nvim_set_keymap(
  "n",
  "<leader>rp",
  ':lua vim.fn.system("echo ".. vim.fn.expand("%:r").. "|pbcopy")<CR>',
  { noremap = true }
)

-- Rename
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>")
keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true })

-- Telescope file browser
keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- Oil file_browser
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Natural indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Fastaction
keymap.set(
  { "n", "x" },
  "<C-.>",
  '<cmd>lua require("fastaction").code_action()<CR>',
  { desc = "Display code actions", buffer = bufnr }
)
