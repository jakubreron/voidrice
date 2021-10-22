-- general
lvim.format_on_save = true
-- lvim.lint_on_save = true


-- appearance
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "gruvbox"
lvim.transparent_window = true

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
vim.opt.colorcolumn = "100"
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true

vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.thesaurus = "~/.config/lvim/mthesaur.txt"

-- whichkey timeout
vim.opt.timeoutlen = 200
