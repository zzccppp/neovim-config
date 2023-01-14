local status, mason = pcall(require, "mason")
if not status then
	vim.notify("not found mason")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("lsp.setup")

require("null-ls.setup")

require("dap.setup")
