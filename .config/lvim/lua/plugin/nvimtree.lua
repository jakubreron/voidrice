local M = {}

M.config = function()
	local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
	if not status_ok then
		return
	end
	local tree_cb = nvim_tree_config.nvim_tree_callback
	lvim.builtin.nvimtree.setup.view.mappings.list = {
		{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
		{ key = "h", cb = tree_cb("close_node") },
		{ key = "v", cb = tree_cb("vsplit") },
		{ key = "s", cb = tree_cb("split") },
		{ key = "<C-t>", cb = tree_cb("system_open") },
	}

	lvim.builtin.nvimtree.side = "left"
	lvim.builtin.nvimtree.hide_dotfiles = false
	lvim.builtin.nvimtree.setup.auto_close = true
	lvim.builtin.nvimtree.show_icons.git = 1
	-- lvim.builtin.nvimtree.ignore = { ".git", ".idea", ".vscode" }
end

return M
