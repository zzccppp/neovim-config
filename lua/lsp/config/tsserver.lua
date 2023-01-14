local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	vim.notify("not found cmp_nvim_lsp")
	return
end

local status, typescript = pcall(require, "typescript")
if not status then
	vim.notify("not found typescript.nvim")
	return
end

typescript.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		capabilities = cmp_nvim_lsp.default_capabilities(),
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = function(client, bufnr)
			-- Disable the formatting function and leave it to a special plug-in plug-in for processing
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			-- Bind shortcut keys
			require("lsp.keybinding").mapLSP(buf_set_keymap)
		end,
	},
})
