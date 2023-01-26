local status, PS_manager = pcall(require, "PS_manager")
if not status then
	vim.notify("not found PS_manager")
	return
end

PS_manager.setup()
