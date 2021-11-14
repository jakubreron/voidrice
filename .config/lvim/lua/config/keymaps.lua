-- save
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys = {
  insert_mode = {
    -- inverted ctrl + h (del)
    ["<C-l>"] = "<Del>",
  },

  normal_mode = {
    ["Y"] = "y$",
    ["0"] = "^",
    ["Q"] = "<cmd>BufferClose!<cr>",

    -- don't store "c" to the register
    -- ["c"] = '"_c'

    -- ["<C-p>"] = "<cmd>Telescope find_files theme=get_ivy<CR>",
  },
}

-- TODO: move which_key bindings into 1 object
-- unmap a default keymapping
lvim.builtin.which_key.mappings["T"] = nil
lvim.builtin.which_key.mappings["h"] = nil

-- git worktrees
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-D> - force deletes that worktree
lvim.builtin.which_key.mappings["gw"] = {
  name = "Worktrees",
  s = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Search the worktrees" },
  c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create a worktree" }
}

lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
end

-- trouble diagnostics
lvim.builtin.which_key.mappings["ld"] = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings["lR"] = { "<cmd>TroubleToggle lsp_references<cr>", "References" }

lvim.builtin.which_key.mappings["ll"] = { ":LspRestart <CR>", "Restart LSP" }
-- lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }

-- langs
lvim.builtin.which_key.mappings["o"] = {
  name = "Ortography",
  e = { ":setlocal spell! spelllang=en<CR>", "English" },
  p = { ":setlocal spell! spelllang=pl<CR>", "Polish" },
  j = { ":setlocal spell! spelllang=ja<CR>", "Japanese" }
}

-- buffer / markdown
lvim.builtin.which_key.mappings["bm"] = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" }

-- buffer / server
lvim.builtin.which_key.mappings["bs"] = {
  name = "Server",
  s = { "<cmd>Bracey<cr>", "Start" },
  k = { "<cmd>BraceyStop<cr>", "Kill" },
  r = { "<cmd>BraceyReload<cr>", "Reload" },
  f = { "<cmd>BraceyEval<cr>", "Force Reload" },
}

-- buffer / zen
lvim.builtin.which_key.mappings["bz"] = { "<cmd>ZenMode<cr>", "Zen" }

-- search & replace
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { ":%s@<c-r><c-w>@<c-r><c-w>@gc<c-f>$F@i", "Find and replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  a = { "<cmd>lua require('spectre').open()<cr>", "Replace anything" },
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
