-- save
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- yank to the end
lvim.keys.normal_mode["Y"] = "y$"

-- repeat last macro used
lvim.keys.normal_mode["Q"] = "@@"

-- don't store "c" to the register
-- lvim.keys.normal_mode["c"] = '"_c'

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- lvim.builtin.terminal.open_mapping = "<>"

-- trouble diagnostics
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

-- symbols outline
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.l.l = { ":LspRestart <CR>", "Restart LSP" }

-- langs
lvim.builtin.which_key.mappings.o = {
  e = { ":setlocal spell! spelllang=en<CR>", "English" },
  -- p = { ":setlocal spell! spelllang=pl<CR>", "Polish" },
  -- j = { ":setlocal spell! spelllang=ja<CR>", "Japanese" }
}

-- markdown preview
lvim.builtin.which_key.mappings.m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" }

-- zendon't
lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", "Zen" }

-- search & replace
lvim.builtin.which_key.mappings.r = {
        name = "Replace",
        r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
        f = { ":%s//g<Left><Left>", "Find and replace" },
}

-- lvim.builtin.which_key.mappings.n = { "<cmd>Lf<cr>", "File manager" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  b = { "<cmd>split term://zsh<cr>", "Terminal to below" },
  r = { "<cmd>vsplit term://zsh<cr>", "Terminal to right" },
}
