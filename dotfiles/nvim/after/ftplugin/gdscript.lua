local port = os.getenv("GDScript_Port") or "7032"
local cmd = { "godot-wsl-lsp", "--host", "172.30.0.1" }
local pipe = "/tmp/godot2.pipe" -- I use /tmp/godot.pipe

vim.lsp.start({
  name = "Godot",
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  end,
})
