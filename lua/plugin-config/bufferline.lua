local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("not found bufferline")
  return
end

-- bufferline config
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- To close the Tab command, use moll/vim-bbye's :Bdelete command here
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- Using nvim's built-in LSP will be configured later in the course
        diagnostics = false,
    },
})
