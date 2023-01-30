local status, codeium = pcall(require, "codeium")
if not status then
	vim.notify("not found codeium")
	return
end

codeium.setup()
