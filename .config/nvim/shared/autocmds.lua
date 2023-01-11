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
