-- utf8
vim.g.encoding = "UTF-8"

vim.g.loaded_perl_provider = 0

vim.o.fileencoding = "utf-8"
-- Keep 8 lines around the cursor when jkhl moves
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
-- Use relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true
-- Highlight the row
vim.wo.cursorline = true
-- Show left icon indicator column
vim.wo.signcolumn = "yes"
-- Right reference line, more than that means the code is too long, consider wrapping
vim.wo.colorcolumn = "100"
-- Indent 2 spaces equals one Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << when moving length
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- space instead of tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- Align new line to current line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- Search is case insensitive, unless uppercase is included
vim.o.ignorecase = true
vim.o.smartcase = true
-- Search do not highlight
vim.o.hlsearch = false
-- Search as you type
vim.o.incsearch = true
-- The command line height is 2, providing enough display space
vim.o.cmdheight = 1
-- Automatically load when the file is modified by an external program
vim.o.autoread = true
vim.bo.autoread = true
-- No line breaks
vim.wo.wrap = false
-- <Left><Right> can jump to the next line when the cursor is at the beginning and end of the line
vim.o.whichwrap = "<,>,[,]"
-- Allows to hide modified buffers
vim.o.hidden = true
-- mouse support
vim.o.mouse = "a"
-- Disable creation of backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- Set timeoutlen to wait 500 milliseconds for the keyboard shortcut combo time, which can be set as needed
vim.o.timeoutlen = 500
-- split window appears from bottom and right
vim.o.splitbelow = true
vim.o.splitright = true
-- Autocompletion is not automatically selected
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- Style
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- Display of invisible characters, here only spaces are displayed as a dot
vim.o.list = true
vim.o.listchars = "space:·,tab:··"
-- Completion enhancement
vim.o.wildmenu = true
-- Don't pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- Completion displays up to 10 lines
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 1
-- vim's modal prompt is no longer required after using the enhanced status bar plugin
vim.o.showmode = false
