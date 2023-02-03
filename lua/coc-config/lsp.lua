local keyset = vim.keymap.set
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

---
-- For diagnostic
---
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "gj", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "gk", "<Plug>(coc-diagnostic-next)", { silent = true })

---
-- For goto code navigation
---
-- definition
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
-- declaration
keyset("n", "gD", "<Plug>(coc-declaration)", { silent = true })
-- type-definition
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
-- implementation
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
-- references
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
-- rename
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


---
-- For hover document
---

local function show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

-- Use K to show documentation in preview window
keyset("n", "K", show_docs, { silent = true })


---
--
---
