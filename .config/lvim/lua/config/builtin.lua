local components = require "lvim.core.lualine.components"
components.filename = {
  "filename",
  path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
  color = {},
  cond = nil,
}

-- Configure builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.comment.active = true
lvim.builtin.gitsigns.active = true
-- lvim.builtin.notify.active = true

lvim.builtin.lualine.sections = {
  lualine_c = {
    components.diff,
    components.python_env,
    provider = function ()
      return require('package-info').get_status()
    end
  },
}
lvim.builtin.lualine.inactive_sections.lualine_a = { components.filename }

lvim.builtin.cmp.experimental.ghost_text = true

-- NOTE: autocompletion
lvim.builtin.cmp.sources = {
  { name = "nvim_lsp" },
  { name = "cmp_tabnine" },
  { name = "path" },
  { name = "luasnip" },
  { name = "nvim_lua" },
  { name = "buffer" },
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

lvim.builtin.nvimtree.ignore = {}
lvim.builtin.nvimtree.hide_dotfiles = 0
vim.g.nvim_tree_indent_markers = 1

-- treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "dockerfile",
  "latex",
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "scss",
  "yaml",
  "vue",
  "regex",
  "html",
  "tsx",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true

-- telescope
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 80
-- lvim.builtin.telescope.defaults.layout_config.width = 0.95

