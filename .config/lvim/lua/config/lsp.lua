-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- NOTE: volar: vue 3 support
-- NOTE: vuels: vue 2 support
-- NOTE: ember: idk
-- NOTE: denols: javascript + typescript runtime
-- vim.list_extend(lvim.lsp.override, { "vuels", "ember", "denols", "eslintls", "stylelint_lsp" })
vim.list_extend(lvim.lsp.override, { "eslintls" })

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

-- require("lvim.lsp.manager").setup "tailwindcss"

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

formatters.setup({
  {
    exe = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "vue",
      "typescript",
      "typescriptreact",
    }
  },
  {
    exe = "stylelint",
    filetypes = {
      "css", "scss", "less", "sass"
    }
  },
  {
    exe = "prettierd",
    filetypes = {
      "html", "markdown", "yaml", "json"
    }
  }
})


linters.setup({
  {
    exe = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "vue",
      "typescript",
      "typescriptreact",
    }
  },
  {
    exe = "stylelint",
    filetypes = {
      "css", "scss", "less", "sass"
    }
  },
})
