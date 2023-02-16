local keymap = vim.keymap.set
local silent = { silent = true }
local expr = { expr = true, noremap = true, silent = true }

-- perform dot commands over visual blocks:
keymap("v", ".", ":normal .<CR>", silent)
-- save file as sudo on files that require root permission
keymap("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")
-- copy to end on Y
keymap("n", "Y", "y$", silent)

-- keep it center
keymap("n", "n", "nzzzv", silent)
keymap("n", "N", "Nzzzv", silent)
keymap("n", "J", "mzJ`z", silent)
keymap("n", "<C-d>", "<C-d>zz", silent)
keymap("n", "<C-u>", "<C-u>zz", silent)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", silent)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", silent)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", silent)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", silent)

-- jumplist
keymap("n", "k", 'v:count > 5 ? "m\'" .. v:count .. "k" : "k"', expr)
keymap("n", "j", 'v:count > 5 ? "m\'" .. v:count .. "j" : "j"', expr)
