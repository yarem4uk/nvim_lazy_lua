local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    -- sorting_strategy = 'ascending',
    file_ignore_patterns = { 'node_modules', '.git' },
    path_display = { 'smart' },
    prompt_prefix = '-> ',

    mappings = {
      i = {
        ['<c-u>'] = false,
        ['<C-d>'] = false,

        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,

        -- ['<leader>e'] = actions.close,
        ['<leader>e'] = actions.close,
      },
      n = {
        ['q'] = actions.close,
        ['gg'] = actions.move_to_top,
        ['G'] = actions.move_to_bottom,

        ['?'] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
    },
    buffers = {
      -- ignore_current_buffers = true,
      -- sort_mru = true,
    },
  },
})

local M = {}

M.find_vim_dot_files = function()
  local opt = {
    -- shorten_path = true,
    cwd = '~/.config/nvim',
    previewer = false,
  }
  builtin.find_files(opt)
end

return M
