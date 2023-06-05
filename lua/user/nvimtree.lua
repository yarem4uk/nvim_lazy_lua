local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
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
    mappings = {
      list = {
        { key = 'h', action = 'dir_up' },
      },
    },
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
})
