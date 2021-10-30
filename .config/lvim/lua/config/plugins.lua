-- vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

-- dashboard
vim.g.dashboard_disable_statusline = 1

lvim.plugins = {
        -- { "folke/tokyonight.nvim" },
        -- { "morhetz/gruvbox" },
        { "vimwiki/vimwiki" },
        { "tpope/vim-repeat" },
        { "tpope/vim-surround" },
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
        {
                "ruifm/gitlinker.nvim", -- quick link to the git snippet
                event = "BufRead",
                config = function()
                        require("plugin.gitlinker").config()
                end,
        },
        {
                "andymass/vim-matchup", -- better "%"
                event = "CursorMoved",
                config = function()
                        require("plugin.matchup")
                end,
        },
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
        -- {
        -- 	"vuki656/package-info.nvim", -- check if the package info is up to date
        --         requires = "MunifTanjim/nui.nvim",
        -- 	config = function()
        -- 		require("plugin.package-info")
        -- 	end,
        -- 	ft = "json",
        -- },
        -- {
        --         "simrat39/symbols-outline.nvim",
        --         -- cmd = "SymbolsOutline",
        --         config = function()
        --                 require("plugin.outline").config()
        --         end,
        -- },
        {
                "folke/trouble.nvim", -- diagnostics
                cmd = "TroubleToggle",
        },
        {
                "kevinhwang91/nvim-bqf", -- better quickfix window (preview, search & replace, etc...)
                event = "BufRead",
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
                "JoosepAlviste/nvim-ts-context-commentstring", -- comment based on the context
                event = "BufRead",
        },
        -- {
        --         "Pocco81/AutoSave.nvim",
        --         config = function()
        --                 require("autosave").setup()
        --         end,
        -- },
        { "kshenoy/vim-signature" }, -- show the marks
        { "christoomey/vim-titlecase" }, -- "gz" movement to toggle the words case
        {
                "phaazon/hop.nvim", -- quickly go to any line
                event = "BufRead",
                config = function()
                        require("plugin.hop").config()
                end,
        },
        -- {
        --         "ethanholz/nvim-lastplace", -- open the file at the place where it was closed
        --         event = "BufRead",
        --         config = function()
        --                 require("nvim-lastplace").setup({
        --                         lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        --                         lastplace_ignore_filetype = {
        --                                 "gitcommit", "gitrebase", "svn", "hgcommit",
        --                         },
        --                         lastplace_open_folds = true,
        --                 })
        --         end,
        -- },
        {
                "folke/persistence.nvim", -- save the last session
                event = "BufReadPre", -- this will only start session saving when an actual file was opened
                module = "persistence",
                config = function()
                        require("persistence").setup {
                                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                                options = { "buffers", "curdir", "tabpages", "winsize" },
                        }
                end,
        },
        {
                "folke/todo-comments.nvim", -- highlight the todo, hack, note, etc... comments
                event = "BufRead",
                config = function()
                        require("todo-comments").setup()
                end,
        },
        --         {
        --                 "tzachar/cmp-tabnine",
        --                 config = function()
        --                         local tabnine = require "cmp_tabnine.config"
        --                         tabnine:setup {
        --                                 max_lines = 1000,
        --                                 max_num_results = 20,
        --                                 sort = true,
        --                         }
        --                 end,

        --                 run = "./install.sh",
        --                 requires = "hrsh7th/nvim-cmp",
        --         },
}


