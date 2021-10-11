-- general
lvim.format_on_save = true
lvim.lint_on_save = true

-- appearance
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "tokyonight"
lvim.transparent_window = true

 -- debug
lvim.debug = false
lvim.log.level = "warn"

-- keymappings
lvim.leader = "space"

-- vim
vim.opt.wrap = false
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true

vim.opt.path = "**"
vim.opt.wildmenu = true
vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.thesaurus = "~/.config/lvim/mthesaur.txt"
