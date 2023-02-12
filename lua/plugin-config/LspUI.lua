local status, LspUI = pcall(require, "LspUI")
if not status then
	vim.notify("not found LspUI")
	return
end

LspUI.setup({
	peek_definition = {
		enable = false,
	},
	lightbulb = {
		enable = true,
		icon = "",
	},
	code_action = {
		icon = "",
	},
})
