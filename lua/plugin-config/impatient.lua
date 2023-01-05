-- improve launch
local status, _ = pcall(require, "impatient")
if not status then
    vim.notify("not found inpatient")
    return
end
