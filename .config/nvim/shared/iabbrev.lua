vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.js", "*.ts", "*.vue", "*.jsx", "*.tsx" },
	callback = function()
    vim.cmd([[
     func Eatchar(pat)
       let c = nr2char(getchar(0))
       return (c =~ a:pat) ? '' : c
     endfunc

     iabbrev cl console.log()<Left><c-r>=Eatchar('\m\s\<bar>/')<CR>
     iabbrev cd console.debug()<Left><c-r>=Eatchar('\m\s\<bar>/')<CR>
   ]])
  end,
})
