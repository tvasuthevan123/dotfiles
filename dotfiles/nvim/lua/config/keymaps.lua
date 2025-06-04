-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

keymap.set("t", "<C-Space>", "<C-\\><C-n><C-w>h", { silent = true })

keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>")

vim.api.nvim_set_keymap(
  "n",
  "<leader>ap",
  ':lua vim.fn.system("echo ".. vim.fn.expand("%:p").. "|pbcopy")<CR>',
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>rp",
  ':lua vim.fn.system("echo ".. vim.fn.expand("%:r").. "|pbcopy")<CR>',
  { noremap = true }
)

-- Define the function to open a new tmux pane and run the current Python file
-- TODO: Fix this...
function open_python_in_new_tmux_pane()
  -- Get the current file path
  local file_path = vim.fn.expand("%:p")

  -- Open a new tmux pane below the current one
  vim.cmd("tmux split-window -h -t.+")

  -- Send the current file path to the new pane
  vim.cmd("tmux send-keys -t.+ \"'. file_path.. '\"")

  -- Execute the Python file in the new pane
  vim.cmd("tmux send-keys -t.+ \"python\" '.. file_path.. ' Enter")
end

-- Bind the function to a key, e.g., <leader>p
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua open_python_in_new_tmux_pane()<cr>", { noremap = true })

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { noremap = true })

-- Telescope file browser
keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- Oil file_browser
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
