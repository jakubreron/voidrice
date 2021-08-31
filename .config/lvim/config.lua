-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general

lvim.lint_on_save = true
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.transparent_window = true

lvim.lang.emmet.active = true
lvim.lang.tailwindcss.active = true

lvim.builtin.autopairs.active = true
lvim.builtin.comment.active = true
lvim.builtin.gitsigns.active = true

vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true

vim.g.vimwiki_list = { {path = '~/vimwiki/', syntax = 'markdown', ext = '.md'} }

-- custom
-- vim.opt.smartindent = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["c"] = "\"_c"

lvim.keys.insert_mode["<C-j>"] = "<esc>:m .+1<CR>== i"
lvim.keys.insert_mode["<C-k>"] = "<esc>:m .-2<CR>== i"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["o"] = { ":setlocal spell! spelllang=en_us<CR>", "Set English spelling" }
lvim.builtin.which_key.mappings["/"] = { ":%s//g<Left><Left>", "Find and replace" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings = {
  -- name = "+Trouble",
  -- r = { "<cmd>Trouble lsp_references<cr>", "References" },
  -- f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  -- d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  -- q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  -- l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  -- w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

lvim.builtin.project.detection_methods = { "pattern" }
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" }

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.nvimtree.hide_dotfiles = false
lvim.builtin.nvimtree.ignore = {".git", ".idea", ".vscode"}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Formatters
lvim.lang.javascript.formatters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters

lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

lvim.lang.vue.formatters = lvim.lang.javascript.formatters

-- Linters
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters

lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters

lvim.lang.vue.linters = lvim.lang.javascript.linters

-- Additional Plugins
lvim.plugins = {
    -- {"folke/tokyonight.nvim"}, {
    --     "ray-x/lsp_signature.nvim",
    --     config = function() require"lsp_signature".on_attach() end,
    --     event = "InsertEnter"
    -- },
    {"vimwiki/vimwiki"}, {},
    {"tpope/vim-surround"}, {
      config = function()
        require "surround".setup {}
      end
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  { "BufWritePost", "bm-files,bm-dirs", "!shortcuts" },
  { "BufRead,BufNewFile", "Xresources,Xdefaults,xresources,xdefaults", "set filetype=xdefaults" },
  { "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
  { "BufWritePost", "~/.local/src/st/config.h", "!cd ~/.local/src/st/; sudo make install" },
  { "BufWritePost", "~/.local/src/dmenu/config.h", "!cd ~/.local/src/dmenu/; sudo make install" },
  { "BufWritePost", "~/.local/src/dwm/config.h", "!cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER 'dwm$')" },
  { "BufWritePost", "~/.local/src/dwmblocks/config.h", "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" },
  { "BufWritePost", "~/.local/bin/statusbar/* ", "!{ killall -q dwmblocks;setsid -f dwmblocks }" },
  { "BufWritePost", "~/.config/personal/universal/vimwiki/*", "!cd ~/vimwiki; git add *; git commit -m 'docs(vimwiki)'; git push;" },
  { "BufWritePost", "~/.config/personal/arch/README.md", "!cd ~/.config/personal/arch; git add *; git commit -m 'docs(readme)'; git push;" },
  { "BufWritePost", "~/.config/personal/universal/README.md", "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(readme)'; git push;" },
  { "BufWritePost", "~.config/personal/universal//.gitconfig", "!cd ~/.config/personal/universal; git add .; git commit -m 'feat(gitconfig)'; git push;" },
  { "BufWritePost", "~/.config/personal/universal/.ticker.yaml", "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(ticker)'; git push;" },
  { "BufWritePost", "~/.config/personal/universal/.config/bookmarks", "!cd ~/.config/personal/universal; git add .; git commit -m 'docs(bookmarks)'; git push;" },
  { "BufWritePost", "~/.config/personal/voidrice/.config/shell/aliasrc", "!cd ~/.config/personal/voidrice; git add .; git commit -m 'feat(aliases)'; git push;" },
  { "BufWritePost", "~/.config/personal/voidrice/.config/newsboat/urls", "!cd ~/.config/personal/voidrice; git add .; git commit -m 'docs(newsboat)'; git push;" },
}

-- Tailwind setup (try to delete it later)
local lspcommon = require "lsp"
require("lspconfig").tailwindcss.setup {
  cmd = {
    "node",
    DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
    "--stdio",
  },
  on_attach = lspcommon.common_on_attach,
  on_init = lspcommon.common_on_init,
}
require("lspconfig").sorbet.setup({
    cmd = { "srb", "tc", "--lsp", "--enable-all-beta-lsp-features" },
})
