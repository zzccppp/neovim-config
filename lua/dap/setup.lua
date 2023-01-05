local status, mason_dap = pcall(require, "mason-nvim-dap")
if not status then
    vim.notify("not found nvim-dap")
    return
end

-- import dap's config
require("dap.dap-config")

local list = require("dap.list")

local handlers = {}
local alones = {}
local sources = {}

for _, ele in pairs(list) do
    table.insert(sources, ele.name)
    if ele.alone then
        table.insert(alones, "dap.config." .. ele.name)
    else
        handlers[ele.name] = require("dap.config." .. ele.name)
    end
end

-- list the debug dependence that must be installed
mason_dap.setup({
    ensure_installed = sources,
})

-- config dap
mason_dap.setup_handlers(handlers)

for _, ele in pairs(alones) do
    require(ele)
end
