-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.colorscheme = "onedarker"
lvim.format_on_save = true
-- lvim.lint_on_save = true
lvim.transparent_window = false
lvim.debug = false

lvim.lang.emmet.active = true
lvim.lang.tailwindcss.lsp.active = true

vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

-- lf
-- vim.g.lf_map_keys = 0
-- vim.g.lf_width = 250
-- vim.g.lf_height = 50

-- custom
vim.opt.wrap = false
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["c"] = '"_c'

lvim.keys.insert_mode["<C-j>"] = "<esc>:m .+1<CR>== i"
lvim.keys.insert_mode["<C-k>"] = "<esc>:m .-2<CR>== i"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.l.e = { ":setlocal spell! spelllang=en_us<CR>", "Set English spelling" }

lvim.builtin.which_key.mappings.m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" }

lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings.r = {
	name = "Replace",
	r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
	w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
	f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
	s = { ":%s//g<Left><Left>", "Find and replace" },
}

lvim.builtin.which_key.mappings.n = { "<cmd>Lf<cr>", "File manager" }

-- Configure builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.comment.active = true
lvim.builtin.gitsigns.active = true

lvim.builtin.project.detection_methods = { "pattern" }
lvim.builtin.project.patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" }

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.nvimtree.hide_dotfiles = false
lvim.builtin.nvimtree.ignore = { ".git", ".idea", ".vscode" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true

-- custom treesitter config
lvim.builtin.treesitter.context_commentstring.enable = true

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
-- js
lvim.lang.javascript.formatters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters

-- ts
lvim.lang.typescript.formatters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

-- html & css
lvim.lang.html.formatters = { { exe = "prettierd" } }
lvim.lang.css.formatters = { { exe = "prettierd" } }

-- misc
lvim.lang.vim.formatters = { { exe = "prettierd" } }
lvim.lang.json.formatters = { { exe = "prettierd" } }

-- Linters
-- js
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters

-- ts
lvim.lang.typescript.linters = { { exe = "eslint_d" } }
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters

-- Additional Plugins
lvim.plugins = {
	{ "vimwiki/vimwiki" },
	{ "tpope/vim-surround" },
	{
		config = function()
			require("surround").setup({})
		end,
	},
	{
		"unblevable/quick-scope",
		config = function()
			require("user.quickscope")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufReadPre",
		config = function()
			require("user.blankline")
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = function()
			require("user.gitlinker").config()
		end,
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			require("user.matchup")
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("user.numb").config()
		end,
	},
	{
		"monaqa/dial.nvim",
		event = "BufRead",
		config = function()
			require("user.dial").config()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.colorizer").config()
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("user.spectre").config()
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("user.zen").config()
		end,
	},
	{
		"vuki656/package-info.nvim",
		config = function()
			require("user.package-info")
		end,
		ft = "json",
	},
	{
		"simrat39/symbols-outline.nvim",
		-- cmd = "SymbolsOutline",
		config = function()
			require("user.outline").config()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		ft = "markdown",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
        {
                "JoosepAlviste/nvim-ts-context-commentstring" ,
        },
	-- {
	--         "ptzz/lf.vim",
	-- },
	-- {
	--         "voldikss/vim-floaterm",
	-- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
	{ "BufWritePost", "bm-files,bm-dirs", "!shortcuts" },
	{ "BufRead,BufNewFile", "Xresources,Xdefaults,xresources,xdefaults", "set filetype=xdefaults" },
	{ "BufWritePost", "Xresources,Xdefaults,xresources,xdefaults", "!xrdb %" },
	{ "BufWritePost", "~/.local/src/st/config.h", "!cd ~/.local/src/st/; sudo make install" },
	{ "BufWritePost", "~/.local/src/dmenu/config.h", "!cd ~/.local/src/dmenu/; sudo make install" },
	{
		"BufWritePost",
		"~/.local/src/dwm/config.h",
		"!cd ~/.local/src/dwm/; sudo make install && kill -HUP $(pgrep -u $USER 'dwm$')",
	},
	{
		"BufWritePost",
		"~/.local/src/dwmblocks/config.h",
		"!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }",
	},
	{
		"BufWritePost",
		"~/.local/src/sxiv-flexipatch/{config.def,patches.def}.h",
		"!cd ~/.local/src/sxiv-flexipatch/; sudo rm {config,patches}.h && sudo make install",
	},
	{
                "BufWritePost",
                "~/.local/bin/statusbar/*",
                "!{ killall -q dwmblocks;setsid -f dwmblocks }",
        },
	{
		"BufWritePost",
		"~/.config/personal/universal/vimwiki/*",
		"!cd ~/vimwiki; git add *; git commit -m 'docs(vimwiki)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/arch/README.md",
		"!cd ~/.config/personal/arch; git add *; git commit -m 'docs(readme)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/universal/README.md",
		"!cd ~/.config/personal/universal; git add .; git commit -m 'docs(readme)'; git push;",
	},
	{
		"BufWritePost",
		"~.config/personal/universal//.gitconfig",
		"!cd ~/.config/personal/universal; git add .; git commit -m 'feat(gitconfig)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/universal/.ticker.yaml",
		"!cd ~/.config/personal/universal; git add .; git commit -m 'docs(ticker)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/universal/.config/bookmarks",
		"!cd ~/.config/personal/universal; git add .; git commit -m 'docs(bookmarks)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/voidrice/.config/shell/aliasrc",
		"!cd ~/.config/personal/voidrice; git add .; git commit -m 'feat(aliases)'; git push;",
	},
	{
		"BufWritePost",
		"~/.config/personal/voidrice/.config/newsboat/urls",
		"!cd ~/.config/personal/voidrice; git add .; git commit -m 'docs(newsboat)'; git push;",
	},
}
