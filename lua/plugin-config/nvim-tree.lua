local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("not found nvim-tree")
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	sort_by = "case_sensitive",
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		adaptive_size = true,
		hide_root_folder = false,
		mappings = {
			list = {
				-- open file or dir
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
				-- split windows open file
				{ key = "v", action = "vsplit" },
				{ key = "h", action = "split" },
				-- show hidden file
				-- { key = "i", action = "toggle_custom" }, -- filters custom (node_modules)
				-- { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
				-- file handle
				{ key = "<F5>", action = "refresh" },
				{ key = "a", action = "create" },
				{ key = "d", action = "remove" },
				{ key = "r", action = "rename" },
				{ key = "x", action = "cut" },
				{ key = "c", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "s", action = "system_open" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
})
