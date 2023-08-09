vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.js", "*.ts", "*.vue", "*.jsx", "*.tsx" },
	callback = function()
    vim.cmd([[
      iabbrev cl console.log( )<Left><Left>
      iabbrev cd console.debug( )<Left><Left>
    ]])
	end,
})
