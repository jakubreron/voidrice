-- save
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- yank to end
lvim.keys.normal_mode["Y"] = "y$"

-- idk
lvim.keys.normal_mode["c"] = '"_c'

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""

-- trouble diagnostics
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

-- symbols outline
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }

-- langs
lvim.builtin.which_key.mappings.l.l = {
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
        f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
        s = { ":%s//g<Left><Left>", "Find and replace" },
}

-- lvim.builtin.which_key.mappings.n = { "<cmd>Lf<cr>", "File manager" }

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  b = { "<cmd>split term://zsh<cr>", "Terminal to below" },
  r = { "<cmd>vsplit term://zsh<cr>", "Terminal to right" },
}
