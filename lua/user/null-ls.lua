local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_ok then
  return
end

mason_null_ls.setup({
  ensure_installed = {
    'prettierd',
    'eslint_d',
    'stylelua',
    'flake8',
    'black',
  },
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {

  -- js
  formatting.prettierd,
  diagnostics.eslint_d,

  -- python
  formatting.black.with({
    extra_args = { '--fast', '-l', 79, '--skip-string-normalization' },
  }),
  diagnostics.flake8,

  -- lua
  formatting.stylua.with({
    extra_args = {
      '--indent-type',
      'Spaces',
      '--indent-width',
      2,
      '--quote-style',
      'AutoPreferSingle',
      '--line-endings',
      'Unix',
    },
  }),
}

null_ls.setup({
  debug = false,
  -- debounce = 150,
  sources = sources,
})
