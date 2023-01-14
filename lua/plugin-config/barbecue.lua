local status, barbecue = pcall(require, "barbecue")
if not status then
	vim.notify("not found barbecue")
	return
end

barbecue.setup()