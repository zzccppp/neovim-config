local dap_util = require("plugin-config.mason.dap.util")

local status, dap = pcall(require, "dap")
if not status then
	vim.notify("not found nvim-dap")
	return
end

local config = function()
	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = dap_util.mason_module_dir .. "/bin/OpenDebugAD7",
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtEntry = false,
			linux = {
				MIMode = "gdb",
				-- miDebuggerPath = "/usr/bin/gdb",
			},
			osx = {
				MIMode = "lldb",
			},
			windows = {
				MIMode = "gdb",
				miDebuggerPath = "C:\\MinGw\\bin\\gdb.exe",
			},
		},
		{
			name = "Attach process",
			type = "cppdbg",
			request = "attach",
			processId = require("dap.utils").pick_process,
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			setupCommands = {
				{
					description = "enable pretty printing",
					text = "-enable-pretty-printing",
					ignoreFailures = false,
				},
			},
		},
		{

			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			-- miDebuggerPath = "/usr/bin/gdb",
			linux = {
				MIMode = "gdb",
				miDebuggerPath = "/usr/bin/gdb",
			},
			osx = {
				MIMode = "lldb",
			},
			windows = {
				MIMode = "gdb",
				miDebuggerPath = "C:\\MinGw\\bin\\gdb.exe",
			},
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
		},
	}
	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
end

return config
