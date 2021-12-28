-- vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

-- dashboard
vim.g.dashboard_disable_statusline = 1

lvim.plugins = {
	-- { "kshenoy/vim-signature" }, -- show the marks
	{ "folke/tokyonight.nvim" }, -- theme
	{ "rebelot/kanagawa.nvim" }, -- theme
	-- { "rose-pine/neovim" }, -- theme
	{ "editorconfig/editorconfig-vim" }, -- .editorconfig support
	{ "andweeb/presence.nvim" }, -- flex with VIM on the discord
	{ "vimwiki/vimwiki" }, -- note taking plugin
	{ "tpope/vim-repeat" }, -- better "."
	-- { "tpope/vim-vinegar" }, -- better "netrw"
	{ "tpope/vim-sleuth" }, -- detect the relevant tabs / shifts
	{ "tpope/vim-jdaddy" }, -- additional json movements
	{ "tpope/vim-surround" }, -- surround movement
	-- {
	--   "ThePrimeagen/git-worktree.nvim", -- git worktree integration
	--   config = function ()
	--     require("telescope").load_extension("git_worktree")
	--   end
	-- },
	{
		"unblevable/quick-scope", -- highlight the scope after using "t" or "f"
		config = function()
			require("plugin.quickscope")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- helper lines
		event = "BufReadPre",
		config = function()
			require("plugin.blankline")
		end,
	},
	-- {
	--   "ruifm/gitlinker.nvim", -- quick link to the git snippet
	--   event = "BufRead",
	--   config = function()
	--     require("plugin.gitlinker").config()
	--   end,
	-- },
	{
		"andymass/vim-matchup", -- better "%"
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	-- {
	--   "sindrets/diffview.nvim", -- single tab diffview
	--   event = "BufRead",
	-- },
	{
		"nacro90/numb.nvim", -- peek the lines (when typing :12 for example)
		event = "BufRead",
		config = function()
			require("plugin.numb").config()
		end,
	},
	{
		"monaqa/dial.nvim", -- better C-a, C-x
		event = "BufRead",
		config = function()
			require("plugin.dial").config()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua", -- highlight the hex / rgb colors
		config = function()
			require("plugin.colorizer").config()
		end,
	},
	{
		"windwp/nvim-spectre", -- search & replace
		event = "BufRead",
		config = function()
			require("plugin.spectre").config()
		end,
	},
	{
		"folke/zen-mode.nvim", -- focus mode
		config = function()
			require("plugin.zen").config()
		end,
	},
	{
		"vuki656/package-info.nvim", -- check if the package info is up to date
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("plugin.package-info")
		end,
		ft = "json",
	},
	{
		"simrat39/symbols-outline.nvim", -- outline the buffer
		-- cmd = "SymbolsOutline",
		config = function()
			require("plugin.outline").config()
		end,
	},
	{
		"folke/trouble.nvim", -- diagnostics
		cmd = "TroubleToggle",
	},
	{
		"kevinhwang91/nvim-bqf", -- better quickfix window (preview, search & replace, etc...)
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim", -- localhost markdown server
		run = "cd app && yarn install",
		ft = "markdown",
	},
	{
		"windwp/nvim-ts-autotag", -- complete or replace the open & closing tags
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"Pocco81/AutoSave.nvim",
		config = function()
			require("autosave").setup()
		end,
	},
	{ "christoomey/vim-titlecase" }, -- "gz" movement to toggle the words case
	{
		"phaazon/hop.nvim", -- quickly go to any line
		event = "BufRead",
		config = function()
			require("plugin.hop").config()
		end,
	},
	-- {
	--   "ethanholz/nvim-lastplace", -- open the file at the place where it was closed
	--   event = "BufRead",
	--   config = function()
	--     require("nvim-lastplace").setup({
	--       lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	--       lastplace_ignore_filetype = {
	--         "gitcommit", "gitrebase", "svn", "hgcommit",
	--       },
	--       lastplace_open_folds = true,
	--     })
	--   end,
	-- },
	{
		"folke/persistence.nvim", -- save the last session
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		"folke/todo-comments.nvim", -- highlight the todo, hack, note, etc... comments
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"felipec/vim-sanegx", -- go to the url using gX
		event = "BufRead",
	},
	-- {
	--   "turbio/bracey.vim",
	--   cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
	--   run = "npm install --prefix server",
	-- },
	{
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},
}
