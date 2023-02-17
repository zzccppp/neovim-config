local status_dapui, dapui = pcall(require, "dapui")
if not status_dapui then
	vim.notify("not found dapui")
	return
end

local status_dap_virtual_text, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status_dap_virtual_text then
	vim.notify("not found nvim-dap-virtual-text")
	return
end

dap_virtual_text.setup({
	commented = true,
})

dapui.setup()

local M = {}

function M.init(dap)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end
end

return M
