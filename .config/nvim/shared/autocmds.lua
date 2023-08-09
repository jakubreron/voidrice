-- NOTE: set to auto read when a file is changed from the outside
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "checktime",
})

-- NOTE: return to last position when editing the file
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*",
	command = "normal g'\"",
})

-- NOTE: set correct filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.tfvars",
	command = "setlocal filetype=tf",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.conf",
	command = "setlocal filetype=conf",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { ".env*" },
	command = "setlocal filetype=sh",
})

-- NOTE: disable diagnostics for other people's code
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { ".env*", "**/node_modules/**" },
	callback = function(args)
		vim.diagnostic.disable(args.buf)
	end,
})

-- NOTE: renew x11 theme
local x_filetypes = { "xresources", "xdefaults" }
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = x_filetypes,
	command = "setlocal filetype=xdefaults",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = x_filetypes,
	command = "!xrdb %",
})

-- NOTE: renew shortcuts
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = "bm-*",
	command = "!shortcuts",
})

-- NOTE: compile suckless scripts & reload them
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = "*/src/*/config.h",
	command = "!sudo make install",
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = "*/src/dwm/config.h",
	command = "!kill -HUP $(pgrep -u $USER '\bdwm$')",
})
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = "*/src/dwmblocks/config.h",
	command = "!{ killall -q dwmblocks;setsid -f dwmblocks }",
})

local auto_commit = function(type, scope)
	return "git add .; git commit -m '"
		.. type
		.. "("
		.. scope
		.. "): ⚙️ auto-commit changes'; git pull && git push;"
end

local function buffer_has_git_changes()
	local filepath = vim.fn.expand("%:p")
	local git_status = vim.fn.system("git diff --name-status " .. filepath)

	return git_status ~= ""
end

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = vim.fn.expand("$VIMWIKI_DIR") .. "/*",
	callback = function()
		if buffer_has_git_changes() then
      vim.fn.jobstart(auto_commit("docs", "vimwiki"), {detach=true})
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = {
		vim.fn.expand("~") .. "/.config/shell/aliasrc*",
		vim.fn.expand("~") .. "/.config/shell/profile*",
    "bm-*",
	},
  callback = function ()
		local filename = vim.fn.expand("%:t")
		if buffer_has_git_changes() then
      vim.fn.jobstart(auto_commit("config", filename), {detach=true})
		end
  end
})
