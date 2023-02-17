local keymap = vim.keymap.set

-- perform dot commands over visual blocks:
keymap("v", ".", ":normal .<CR>", { silent = true })

-- paste without yank
keymap("v", "<leader>p", '"_dP', { silent = true, desc = "Paste without yank" })

-- toggle eventignore
keymap("n", "yoe", function()
	vim.cmd("set eventignore=" .. (vim.o.eventignore == "" and "all" or ""))
end, { silent = true, desc = "Toggle eventignore" })

-- languages
keymap("n", "yoss", "<cmd>setlocal spell!<CR>", { silent = true, desc = "Toggle spelling" })
keymap("n", "yosp", "<cmd>setlocal spell! spelllang=pl<CR>", { silent = true, desc = "Set Polish spelling" })
keymap("n", "yose", "<cmd>setlocal spell! spelllang=en<CR>", { silent = true, desc = "Set English spelling" })

-- diagnostics
keymap("n", "]x", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>", { silent = true, desc = "Next diagnostic" })
keymap("n", "[x", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>", { silent = true, desc = "Prev diagnostic" })

-- save file as sudo on files that require root permission
keymap("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { desc = "Write as sudo" })

-- copy to end on Y
keymap("n", "Y", "y$", { silent = true })

-- nohighlight on esc
keymap("n", "<ESC>", "<cmd>noh<CR>", { silent = true })

-- copy whole file
keymap("n", "<C-c>", "<cmd>%y+<CR>", { silent = true })

-- keep it center
keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })
keymap("n", "J", "mzJ`z", { silent = true })
keymap("n", "<C-d>", "<C-d>zz", { silent = true })
keymap("n", "<C-u>", "<C-u>zz", { silent = true })
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })

-- jumplist every 5 lines jump with j/k
keymap("n", "k", 'v:count > 5 ? "m\'" .. v:count .. "k" : "k"', { expr = true, silent = true })
keymap("n", "j", 'v:count > 5 ? "m\'" .. v:count .. "j" : "j"', { expr = true, silent = true })
