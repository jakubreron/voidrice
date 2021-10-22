-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false
-- lvim.lsp.automatic_servers_installation = false
lvim.lsp.override = { "volar" }
-- lvim.lsp.override = { "vuels" }

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
      "css", "scss", "less"
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
      "css", "scss", "less"
    }
  },
})

--
-- Does package.json file contain speficied configuration or dependency?
-- (e.g. "prettier")
-- IMPORTANT! package.json file is found only if current working directory (cwd)
-- is in the root of the project, i.e. lvim was launched in the directory
-- where package.json is or vim-rooter (or something similar) is activated
--
local is_in_package_json = function(field)
  if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") ~= 0 then
    local package_json = vim.fn.json_decode(vim.fn.readfile "package.json")
    if package_json[field] ~= nil then
      return true
    end
    local dev_dependencies = package_json["devDependencies"]
    if dev_dependencies ~= nil and dev_dependencies[field] ~= nil then
      return true
    end
    local dependencies = package_json["dependencies"]
    if dependencies ~= nil and dependencies[field] ~= nil then
      return true
    end
  end
  return false
end

--
-- Does current project contain tailwindcss configuration
--
local project_has_tailwindcss_dependency = function()
  return (vim.fn.glob "tailwind*" ~= "" or is_in_package_json "tailwindcss")
end

--- Setup tailwindcss LSP if project has tailwindcss configuration
if project_has_tailwindcss_dependency() == true then
  require("lvim.lsp.manager").setup "tailwindcss"
else
  vim.list_extend(lvim.lsp.override, { "tailwindcss" })
end
