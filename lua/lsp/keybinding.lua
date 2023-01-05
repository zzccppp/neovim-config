local map = vim.api.nvim_set_keymap
-- Multiplexing opt parameters
local opt = { noremap = true, silent = true }
local M={}
M.mapLSP = function(mapbuf)
    -- rename
    -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    -- code action
    -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    -- go xx
    -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
    -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)

    -- 不支持 mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    -- diagnostic
    -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
    -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return M
