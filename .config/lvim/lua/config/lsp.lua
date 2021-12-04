-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = {
  "angularls",
  "ansiblels",
  "denols",
  "ember",
  "eslint",
  "eslintls",
  "graphql",
  "jedi_language_server",
  "phpactor",
  "pylsp",
  "rome",
  "sorbet",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  "tflint",
  "ltex",
  -- "vuels", -- NOTE: vue 2
  -- "volar", -- NOTE: vue 3
  -- "tailwindcss",
  -- "emmet_ls",
}

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


