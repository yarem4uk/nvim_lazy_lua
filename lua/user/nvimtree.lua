local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
end

tree.setup({
  sort_by = 'case_sensitive',
  actions = {
    open_file = { quit_on_open = true },
  },
  select_prompts = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 24,
  },
  renderer = {
    group_empty = true,
    indent_width = 1,
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
      },
    },
  },
  filters = {
    dotfiles = true,
    custom = { '^.git$', '^node_modules$' },
  },
  git = {
    enable = false,
  },
  on_attach = on_attach,
})
