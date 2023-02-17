local dap_util = require("plugin-config.mason.dap.util")

local status, dap_python = pcall(require, "dap-python")
if not status then
	vim.notify("not found nvim-dap-python")
	return
end
dap_python.setup(dap_util.mason_module_dir .. "/packages/debugpy/venv/bin/python")
