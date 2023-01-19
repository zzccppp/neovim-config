local status, focus = pcall(require, "focus")
if not status then
	vim.notify("not found focus")
	return
end

focus.setup({
	signcolumn = false,
})
