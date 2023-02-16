-- Set to auto read when a file is changed from the outside
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "checktime",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	command = "normal g'\"",
})

local x_filetypes = { "xresources", "xdefaults" }
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = x_filetypes,
	command = "setlocal filetype=xdefaults",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = x_filetypes,
	command = "!xrdb %",
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
	pattern = { vim.fn.expand("~") .. "/.config/shell/aliasrc*" },
	command = auto_commit("config", "alias"),
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { vim.fn.expand("~") .. "/.config/shell/profile*" },
	command = auto_commit("config", "profile"),
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*/src/*/config.h" },
	command = "!sudo make install",
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*/src/dwm/config.h" },
	command = "!kill -HUP $(pgrep -u $USER '\bdwm$')",
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*/src/dwmblocks/config.h" },
	command = "!{ killall -q dwmblocks;setsid -f dwmblocks }",
})
