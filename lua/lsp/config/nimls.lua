local opt = {
    on_attach = function(client, bufnr)
        -- Disable the formatting function and leave it to a special plug-in plug-in for processing
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- Bind shortcut keys
        require("lsp.keybinding").mapLSP(buf_set_keymap)
        -- if init_config then
        -- 	-- print(lsp_name .. "lsp register") -- debug
        -- 	-- Auto format on save
        -- 	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
        -- 	init_config = false
        -- end
    end,
}

return opt
