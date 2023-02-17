local map = vim.api.nvim_set_keymap
-- Multiplexing opt parameters
local opt = { noremap = true, silent = true }
local M = {}

function M.init()
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
end

return M
