local keymap = vim.keymap.set

-- quit all buffers, not only current one
keymap("n", "ZQ", "<cmd>qa!<CR>", { silent = true })

-- definition in split
keymap("n", "<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Goto definiton vsplit" })

-- save
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" })

-- perform dot commands over visual blocks:
keymap("v", ".", "<cmd>normal .<CR>", { silent = true })

-- paste without yank
keymap("v", "<leader>p", '"_dP', { silent = true, desc = "Paste without yank" })

-- toggle eventignore
keymap("n", "yoe", function()
	vim.cmd("set eventignore=" .. (vim.o.eventignore == "" and "all" or ""))
	print(vim.o.eventignore == "" and "Do not ignore" or "Ignore all")
end, { silent = true, desc = "Toggle eventignore" })

-- languages
keymap("n", "yoss", "<cmd>setlocal spell!<CR>", { silent = true, desc = "Toggle spelling" })
keymap("n", "yosp", "<cmd>setlocal spell! spelllang=pl<CR>", { silent = true, desc = "Set Polish spelling" })
keymap("n", "yose", "<cmd>setlocal spell! spelllang=en<CR>", { silent = true, desc = "Set English spelling" })

-- diagnostics
keymap(
	"n",
	"]d",
	"<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>",
	{ silent = true, desc = "Next diagnostic" }
)
keymap(
	"n",
	"[d",
	"<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>",
	{ silent = true, desc = "Prev diagnostic" }
)

-- save file as sudo on files that require root permission
keymap("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { desc = "Write as sudo" })

-- copy to end on Y
keymap("n", "Y", "y$", { silent = true })

-- nohighlight on esc
keymap("n", "<ESC>", "<cmd>noh<CR>", { silent = true })

-- copy whole file
keymap("n", "<C-c>", "<cmd>%y+<CR>", { silent = true })

-- keep it center
-- keymap("n", "n", "nzzzv", { silent = true })
-- keymap("n", "N", "Nzzzv", { silent = true })
-- keymap("n", "J", "mzJ`z", { silent = true })

keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

keymap("n", "<A-h>", ":vertical resize +2<CR>", { silent = true })
keymap("n", "<A-j>", ":resize -2<CR>", { silent = true })
keymap("n", "<A-k>", ":resize +2<CR>", { silent = true })
keymap("n", "<A-l>", ":vertical resize -2<CR>", { silent = true })

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })

-- jumplist every 5 lines jump with j/k
keymap("n", "k", 'v:count > 5 ? "m\'" .. v:count .. "k" : "k"', { expr = true, silent = true })
keymap("n", "j", 'v:count > 5 ? "m\'" .. v:count .. "j" : "j"', { expr = true, silent = true })

-- LSP
keymap("n", "<leader>l_", "<cmd>LspRestart <CR>", { desc = "Restart LSP" })

-- console
keymap("n", "<leader>cs", "<C-w>s:term<CR>", { desc = "Split Horizontal" })
keymap("n", "<leader>cv", "<C-w>v:term<CR>", { desc = "Split Vertical" })
keymap("n", "<leader>ct", "<cmd>tabnew<CR><cmd>term<CR><cmd>setlocal nonumber norelativenumber<CR>", { desc = "New Tab" })
keymap("n", "<leader>cn", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "New Tmux Session" })

-- tabs
keymap("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New" })
keymap("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close" })
keymap("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Only" })
keymap("n", "<leader>tm", ":tabmove", { desc = "Move" })
keymap("n", "<leader>te", ":tabedit <C-r>=expand('%:p:h')<CR>/", { desc = "Edit" })

-- switch to last used tab
vim.api.nvim_create_autocmd("TabLeave", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_keymap(
			"n",
			"<leader>;",
			"<cmd>tabn " .. vim.api.nvim_tabpage_get_number(0) .. "<CR>",
			{ desc = "Last used tab", noremap = true, silent = true }
		)
	end,
})
