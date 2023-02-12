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

require("plugin-config.mason.lsp")
require("plugin-config.mason.null-ls")