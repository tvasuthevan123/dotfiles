-- local port = os.getenv('GDScript_Port') or '6005'
-- local cmd = vim.lsp.rpc.connect("172.30.0.1", port)
-- local pipe = '/tmp/godot.pipe'
--
-- vim.lsp.start({
--   name = 'Godot',
--   cmd = cmd,
--   filetypes = { 'gdscript' },
--   root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, {
--     upward = true,
--     path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
--   })[1]),
--   on_attach = function(client)
--     local _notify = client.notify
--     client.notify = function(method, params)
--       if method == 'textDocument/didClose' then
--         -- Godot doesn't implement didClose yet
--         return
--       end
--       _notify(method, params)
--     end
--   end,
-- })
