-- vimwiki
vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }

-- dashboard
vim.g.dashboard_disable_statusline = 1

lvim.plugins = {
        { "folke/tokyonight.nvim" },
        -- { "morhetz/gruvbox" },
        { "vimwiki/vimwiki" },
        { "tpope/vim-surround" },
        { "tpope/vim-repeat" },
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
                event = "BufReadPre",
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
                config = function()
                        require("nvim-ts-autotag").setup()
                end,
        },
        {
                "JoosepAlviste/nvim-ts-context-commentstring",
                event = "BufRead",
        },
        -- {
        --         "Pocco81/AutoSave.nvim",
        --         config = function()
        --                 require("autosave").setup()
        --         end,
        -- },
        { "kshenoy/vim-signature" },
        { "christoomey/vim-titlecase" },
        {
                'phaazon/hop.nvim',
                event = "BufRead",
                config = function()
                        require("plugin.hop").config()
                end,
        },
        {
                "karb94/neoscroll.nvim",
                event = "WinScrolled",
                config = function()
                        require('neoscroll').setup({
                                -- All these keys will be mapped to their corresponding default scrolling animation
                                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                                        '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
                                hide_cursor = true,          -- Hide cursor while scrolling
                                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                                easing_function = nil,        -- Default easing function
                                pre_hook = nil,              -- Function to run before the scrolling animation starts
                                post_hook = nil,              -- Function to run after the scrolling animation ends
                        })
                end
        },
        {
                "ethanholz/nvim-lastplace",
                event = "BufRead",
                config = function()
                        require("nvim-lastplace").setup({
                                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                                lastplace_ignore_filetype = {
                                        "gitcommit", "gitrebase", "svn", "hgcommit",
                                },
                                lastplace_open_folds = true,
                        })
                end,
        },
        {
                "folke/persistence.nvim",
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
                "folke/todo-comments.nvim",
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


