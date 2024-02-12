-- local bfnr = 1

-- vim.api.nvim_buf_set_lines(bfnr, 0, -1, false, { 'hello', 'alena' })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('coll', { clear = true }),
  pattern = '*.lua',
  callback = function()
    print('file saved')
  end,
})
