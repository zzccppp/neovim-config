local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("not found colorizer")
	return
end

colorizer.setup()
