-- save
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- yank to the end
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["0"] = "^"

-- inverted ctrl + h (del)
lvim.keys.insert_mode["<C-l>"] = "<Del>"

-- repeat last macro used
-- lvim.keys.normal_mode["Q"] = "@@"

-- don't store "c" to the register
-- lvim.keys.normal_mode["c"] = '"_c'

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- lvim.builtin.terminal.open_mapping = "<>"

-- trouble diagnostics
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

lvim.builtin.which_key.mappings.l.l = { ":LspRestart <CR>", "Restart LSP" }
-- lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }

-- langs
lvim.builtin.which_key.mappings.o = {
  e = { ":setlocal spell! spelllang=en<CR>", "English" },
  p = { ":setlocal spell! spelllang=pl<CR>", "Polish" },
  j = { ":setlocal spell! spelllang=ja<CR>", "Japanese" }
}

-- buffer
lvim.builtin.which_key.mappings.b.m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" }

-- buffer / server
lvim.builtin.which_key.mappings.b.s = {
  s = { "<cmd>Bracey<cr>", "Start" },
  k = { "<cmd>BraceyStop<cr>", "Kill" },
  r = { "<cmd>BraceyReload<cr>", "Reload" },
  f = { "<cmd>BraceyEval<cr>", "Force Reload" },
}

lvim.builtin.which_key.mappings.z = { "<cmd>ZenMode<cr>", "Zen" }

-- search & replace
lvim.builtin.which_key.mappings.r = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { ":%s//g<Left><Left>", "Find and replace" },
}

-- lvim.builtin.which_key.mappings.n = { "<cmd>Lf<cr>", "File manager" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Todo",
  q = { "<cmd>TodoQuickFix<cr>", "Todo Quick Fix" },
  t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
  s = { "<cmd>TodoTelescope<cr>", "Todo Search" }
}
