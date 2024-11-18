local lazy = require("lazy.core.config")

local M = {}

function M.get_plugin(plugin_name)
    local plugins = lazy.plugins
    return plugins[plugin_name] ~= nil
end

function M.has(plugin)
    return M.get_plugin(plugin) ~= nil
end

return M
