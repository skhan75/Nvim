local M = {}

function M.setup(opts)
    local config = require("todolens.config")
    config.setup(opts)
    require("todolens.highlight").setup()
end

return M

