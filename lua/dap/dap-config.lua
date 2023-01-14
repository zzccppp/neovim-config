local status, dap = pcall(require, "dap")
if not status then
	vim.notify("not found dap")
	return
end

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

-- Define various icons

vim.fn.sign_define("DapBreakpoint", {
	text = "◉",
	texthl = "LspDiagnosticsSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "LspDiagnosticsSignInformation",
	linehl = "DiagnosticUnderlineInfo",
	numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "LspDiagnosticsSignHint",
	linehl = "",
	numhl = "",
})

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "o", "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},

	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
}) -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

-- Bind nvim-dap shortcuts

local map = vim.api.nvim_set_keymap
-- Multiplexing opt parameters
local opt = { noremap = true, silent = true }
-- Begin
map("n", "<leader>dd", ":lua require('dap').continue()<CR>", opt)
-- Stop
map(
	"n",
	"<leader>de",
	":lua require'dap'.close()<CR>"
		.. ":lua require'dap'.terminate()<CR>"
		.. ":lua require'dap.repl'.close()<CR>"
		.. ":lua require'dapui'.close()<CR>"
		.. ":lua require('dap').clear_breakpoints()<CR>"
		.. "<C-w>o<CR>",
	opt
)
-- Continue
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
-- Set BreakPoint
map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
--  stepOver, stepOut, stepInto
map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
-- Pop-ups
map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
