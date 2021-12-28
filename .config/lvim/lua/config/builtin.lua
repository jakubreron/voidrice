-- Configure builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.comment.active = true
lvim.builtin.gitsigns.active = true
-- lvim.builtin.notify.active = true

local components = require("lvim.core.lualine.components")
components.filename = {
	"filename",
	path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
	color = {},
	cond = nil,
}

local function packageinfo()
	return require("package-info").get_status()
end

lvim.builtin.lualine.sections = {
	lualine_c = {
		components.diff,
		components.python_env,
		packageinfo,
	},
	-- lualine_z = { "location" }
}

lvim.builtin.lualine.inactive_sections.lualine_a = { components.filename }

lvim.builtin.cmp.experimental.ghost_text = true

vim.g.bufferline = {
	auto_hide = true,
	animation = false,
}

lvim.builtin.cmp.completion.completeopt = "menu,menuone,noselect,preview"
lvim.builtin.cmp.preselect = require("cmp").PreselectMode.None
lvim.builtin.cmp.sources = {
	{ name = "nvim_lsp" },
	{ name = "path", max_item_count = 5 },
	{ name = "luasnip", max_item_count = 3 },
	{ name = "cmp_tabnine", max_item_count = 3 },
	{ name = "nvim_lua" },
	{ name = "buffer", max_item_count = 5, keyword_length = 5 },
	{ name = "calc" },
	{ name = "emoji" },
	{ name = "treesitter" },
	{ name = "crates" },
}

-- TODO: enable these lines only for certain projects
-- detection patterns (custom nuxt modules fix)
-- lvim.builtin.project.active = false
lvim.builtin.project.detection_methods = { "pattern" }
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" }

-- lvim.builtin.nvimtree.setup.filters.custom = {}
vim.g.nvim_tree_indent_markers = 1

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true

-- telescope
-- lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 80
-- lvim.builtin.telescope.defaults.layout_config.width = 0.95
