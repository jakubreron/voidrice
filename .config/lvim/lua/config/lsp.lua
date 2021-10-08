-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- 	local function buf_set_option(...)
-- 		vim.api.nvim_buf_set_option(bufnr, ...)
-- 	end
-- 	--Enable completion triggered by <c-x><c-o>
-- 	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Langs
lvim.lang.emmet.active = true
lvim.lang.tailwindcss.active = true

lvim.lang.javascript = {
        formatters = { { exe = "eslint_d" } },
        linters = { { exe = "eslint_d" } },
}

lvim.lang.vue = {
        formatters = { { exe = "eslint_d" } },
        linters = { { exe = "eslint_d" } },
}

lvim.lang.typescript = {
        formatters = { { exe = "eslint_d" } },
        linters = { { exe = "eslint_d" } },
}

lvim.lang.html.formatters = { { exe = "prettierd" } }

lvim.lang.css = {
        formatters = { { exe = "stylelint" } },
        linters = { { exe = "stylelint" } },
}

lvim.lang.scss = {
        formatters = { { exe = "stylelint" } },
        linters = { { exe = "stylelint" } },
}

lvim.lang.json.formatters = { { exe = "prettierd" } }

