local status, peek = pcall(require, "peek")
if not status then
	vim.notify("not found peek")
	return
end

peek.setup()
