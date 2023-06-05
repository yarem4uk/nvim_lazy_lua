local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = { 'lua', 'python', 'typescript', 'javascript', 'rust', 'vim', 'regex', 'json', 'css' },
  highlight = { enable = true },
  indent = { enable = true },
  additional_vim_regex_highlighting = true,
})
