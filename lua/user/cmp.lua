local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end

-- local lua_ok, ls = pcall(require, 'luasnip')
-- if not lua_ok then
--   return
-- end

-- require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/snippets' })

cmp.setup({
  -- completion = {
  -- autocomplete = false,
  -- },
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<c-n>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<c-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<c-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' },
  },
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
]])
