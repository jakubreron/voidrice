vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

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
			require("plugin.quickscope")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufReadPre",
		config = function()
			require("plugin.blankline")
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		event = "BufRead",
		config = function()
			require("plugin.gitlinker").config()
		end,
	},
	{
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			require("plugin.matchup")
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("plugin.numb").config()
		end,
	},
	{
		"monaqa/dial.nvim",
		event = "BufRead",
		config = function()
			require("plugin.dial").config()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugin.colorizer").config()
		end,
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("plugin.spectre").config()
		end,
	},
	{
		"folke/zen-mode.nvim",
                config = function()
                        require("plugin.zen").config()
                end,
        },
        -- {
        -- 	"vuki656/package-info.nvim",
        -- 	config = function()
        -- 		require("plugin.package-info")
        -- 	end,
        -- 	ft = "json",
        -- },
	{
		"simrat39/symbols-outline.nvim",
		-- cmd = "SymbolsOutline",
		config = function()
			require("plugin.outline").config()
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


