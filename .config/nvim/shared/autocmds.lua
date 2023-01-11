local x_filetypes = { "xresources", "xdefaults" }
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = x_filetypes,
	command = "setlocal filetype=xdefaults",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = x_filetypes,
	command = "!xrdb %",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "/tmp/calcurse*", "~/.calcurse/notes/*" },
	command = "setlocal filetype=markdown",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ms", "*.me", "*.mom", "*.man" },
	command = "setlocal filetype=groff",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.tex" },
	command = "setlocal filetype=text",
})

local auto_commit = function(type, scope)
	return "!git add .; git commit -m '" .. type .. "(" .. scope .. "): ⚙️ auto-commit changes'; git push;"
end

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "bm-*" },
	command = auto_commit("config", "bm-files") .. "shortcuts",
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { vim.fn.expand("$VIMWIKI_DIR") .. "/*" },
	command = auto_commit("docs", "vimwiki"),
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { vim.fn.expand("$DOTFILES_DIR") .. "/voidrice/.config/*" },
	command = auto_commit("config", "config"),
})

-- Set to auto read when a file is changed from the outside
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = { "*" },
	command = "checktime",
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "config.h" },
	command = "!sudo make install",
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { vim.fn.expand("~") .. "/.local/src/dwm/config.h" },
	command = "!kill -HUP $(pgrep -u $USER '\bdwm$')",
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { vim.fn.expand("~") .. "/.local/src/dwmblocks/config.h" },
	command = "!{ killall -q dwmblocks;setsid -f dwmblocks }",
})
