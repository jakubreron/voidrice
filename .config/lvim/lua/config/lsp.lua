-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

lvim.lsp.document_highlight = true
lvim.lsp.code_lens_refresh = true

require("lvim.lsp.manager").setup("emmet_ls")
-- require("lvim.lsp.manager").setup("tailwindcss")
-- require("lvim.lsp.manager").setup("volar")

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.name == "tsserver" or client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")

local filetypes = {
	eslint = {
		"javascript",
		"javascriptreact",
		"vue",
		"typescript",
		"typescriptreact",
	},
	stylelint = {
		"css",
		"scss",
		"less",
		"sass",
	},
	prettier = {
		"html",
		"markdown",
		"yaml",
		"json",
	},
}

formatters.setup({
	{ exe = "eslint_d", filetypes = filetypes.eslint },
	{ exe = "stylelint", filetypes = filetypes.stylelint },
	{ exe = "prettierd", filetypes = filetypes.prettier },
	{ exe = "stylua", filetypes = { "lua" } },
})

linters.setup({
	{ exe = "eslint_d", filetypes = filetypes.eslint },
	{ exe = "stylelint", filetypes = filetypes.stylelint },
	{ exe = "luacheck", filetypes = { "lua" } },
})
