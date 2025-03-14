local snip_ok, ls = pcall(require, 'luasnip')
if not snip_ok then
  return
end

local silent = { silent = true }

require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets' })

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
})

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  -- if ls.expand_or_jumpable(1) then
  --   ls.expand_or_jump(1)
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, silent)

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, silent)
vim.keymap.set('n', '<leader>i', '<cmd>source ~/.config/nvim/lua/user/luasnip.lua<cr>')
