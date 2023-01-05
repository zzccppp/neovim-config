local status, schemastore = pcall(require, "schemastore")
if not status then
    vim.notify("not found cmp_nvim_lsp")
    return
end

local opt = {
    settings = {
        schemas = schemastore.json.schemas(),
    },
}

return opt
