local lazy = require("lazy").lazy

function get_plugin(plugin_name)
    local plugins = lazy.plugins
    return plugins[plugin_name] ~= nil
end

function has(plugin)
    return get_plugin(plugin) ~= nil
end
