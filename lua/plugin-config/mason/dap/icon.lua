-- this file is for setting dap icon
local M = {}

function M.init()
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
end

return M
