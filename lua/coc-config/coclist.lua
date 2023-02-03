-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local keyset = vim.keymap.set
local opts = { silent = true, nowait = false }
-- Show all diagnostics
keyset("n", "<space>d", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>cc", ":CocList <cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
-- keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
-- coclist to find
keyset("n", "<C-p>", ":CocList files<CR>", opts)
keyset("n", "<C-f>", ":CocList grep<CR>", opts)
