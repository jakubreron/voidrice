local options = {
	dictionary = "/usr/share/dict/words",
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" },
	conceallevel = 0, -- so that `` is visible in markdown files
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 0, -- time to wait for a mapped sequence to complete (in milliseconds)
	title = true, -- set the title of window to the value of the titlestring
	-- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
	undofile = true, -- enable persistent undo
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	cursorline = true, -- highlight the current line
	relativenumber = true,
	number = true, -- set numbered lines
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 10, -- minimal number of screen lines to keep above and below the cursor.
	sidescrolloff = 10, -- minimal number of screen lines to keep left and right of the cursor.
	laststatus = 3,
	lazyredraw = true, -- Don't redraw while executing macros (good performance config)
	linebreak = true, -- set linebreak on very long lines
	textwidth = 500, -- linebreak on 500 characters
  colorcolumn = "80",
  winbar = "%=%m %f",
}

local globals = {
	mapleader = " ", -- space
}

-- vim.opt.path:append("**")
-- vim.opt.wildignore:append("*.o")
-- vim.opt.wildignore:append("*.pyc")
-- vim.opt.wildignore:append("*_build/*")
-- vim.opt.wildignore:append("**/coverage/*")
-- vim.opt.wildignore:append("**/node_modules/*")
-- vim.opt.wildignore:append("**/android/*")
-- vim.opt.wildignore:append("**/ios/*")
-- vim.opt.wildignore:append("**/.git/*")
-- vim.opt.wildignore:append("tags")

vim.opt.spelllang:append("cjk") -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(options) do
	vim.opt[k] = v
end

for k, v in pairs(globals) do
	vim.g[k] = v
end

vim.b.match_words = "<<<<<<<:=======:>>>>>>>" -- match git conflict markers with %
