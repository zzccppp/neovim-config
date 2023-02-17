local status, dap = pcall(require, "dap")
if not status then
	vim.notify("not found dap")
	return
end

local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_status then
	vim.notify("not found mason-nvim-dap")
	return
end

local dap_icon = require("plugin-config.mason.dap.icon")
local dap_ui = require("plugin-config.mason.dap.ui")
local dap_keybind = require("plugin-config.mason.dap.keybind")

dap_icon.init()
dap_ui.init(dap)
dap_keybind.init()

local list = require("plugin-config.mason.dap.list")

local handlers = {}
local alones = {}
local ensure_installed = {}

for _, ele in pairs(list) do
	table.insert(ensure_installed, ele.name)
	if ele.alone then
		table.insert(alones, "plugin-config.mason.dap.config." .. ele.name)
	else
		handlers[ele.name] = require("plugin-config.mason.dap.config." .. ele.name)
	end
end

-- list the debug dependence that must be installed
mason_dap.setup({
	ensure_installed = ensure_installed,
})

-- setting for handle
mason_dap.setup_handlers(handlers)

for _, ele in pairs(alones) do
	require(ele)
end
