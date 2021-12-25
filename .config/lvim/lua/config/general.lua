-- general
lvim.format_on_save = false
lvim.lint_on_save = false

-- debug
lvim.debug = false
lvim.log.level = "warn"

-- keymappings
lvim.leader = "space"

-- vim
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.relativenumber = true
vim.opt.hlsearch = false
-- vim.opt.colorcolumn = "100"
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.spelllang:append("cjk") -- NOTE: disable spellchecking for asian characters

vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.thesaurus = "~/.config/lvim/mthesaur.txt"
