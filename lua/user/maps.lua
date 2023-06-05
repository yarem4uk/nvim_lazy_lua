local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--local map = vim.api.nvim_set_keymap
--local default = { noremap = true, silent = true }

local silent = { silent = true }

-- disabling keys
local disabling_keys = { '<up>', '<down>', '<left>', '<right>', '<bs>' }

for i = 1, #disabling_keys do
  local mode = { 'i', 'c', '' }
  for m = 1, #mode do
    map(mode[m], disabling_keys[i], '<NOP>', silent)
  end
end

map('', '<leader><leader>', '<C-^>', silent)
map('i', ';e', '<esc>', silent)

-- map('i', 'sm', '<cr>', silent)
-- map('n', 'sm', '<cr>', silent)
-- map('c', 'sm', '<cr>', silent)

map('c', '<c-j>', '<Down>', {})

map('i', ',w', '<esc>:w<cr>', silent)
map('', ',w', ':w<cr>', silent)

-- COMMAND MAPPING
map('', [[']], [[`]], silent)
map('', [[`]], [[']], silent)

map('n', 'k', 'gk', silent)
map('n', 'gk', 'k', silent)
map('n', 'j', 'gj', silent)
map('n', 'gj', 'j', silent)

map('v', '"y', '"*y', silent)
map('n', '"y', '"*y', silent)
map('n', '"p', '"*p', silent)

map('n', 'x', '"_x', silent)

map('', 'Y', 'y$', silent)

-- Make Ctrl-e jump to the end of the line in the insert mode.
map('', '<C-k>', '<C-w><Up>', silent)
map('', '<C-j>', '<C-w><Down>', silent)
map('', '<C-l>', '<C-w><Right>', silent)
map('', '<C-h>', '<C-w><Left>', silent)

map('', '<leader>f', ':Telescope find_files<cr>', silent)
map('', '<leader>g', ':Telescope live_grep<cr>', silent)
map('', '<leader>b', ':Telescope buffers<cr>', silent)

-- open luavim files by telescope
-- map('n', [[<C-\>]], "<cmd>lua require('user.telescope').find_vim_dot_files()<cr>", silent)
map('n', '<leader>h', "<cmd>lua require('user.telescope').find_vim_dot_files()<cr>", silent)

map('n', ',,', ':NvimTreeToggle<cr>', silent)
map('n', '<leader>,', ':NvimTreeFindFile<cr>', silent)

--movement
map('o', 'im', 'i[', silent)
map('o', 'in', ':<c-u>normal! f(vi(<cr>', silent)
map('o', 'il', ':<c-u>normal! F)vi(<cr>', silent)

-- map('i', 'AA', '<esc>A', silent)
-- map('n', 'AA', '<esc>A', silent)
-- map('i', '<c-i>', '<tbs>', silent)

-- LEADER MAPING

-- upper/lower word
map('n', '<leader>u', [[mQviwU'Q]], silent)
map('n', '<leader>l', [[mQviwu'Q]], silent)

-- formatting
-- map('n', '<leader>f', ':Format<cr>', silent)

-- curl
map('n', '<leader>m', ':Curl<cr>', silent)
map('n', '<leader>n', ':bd!<cr>', silent)

map('v', '<leader>y', ':w! ~/.vbuf<cr>', silent)
map('', '<leader>y', ':.w! ~/.vbuf<cr>', silent)
map('', '<leader>p', ':r ~/.vbuf<cr>', silent)

map('', '<leader>q', ':q!<cr>', silent)
map('', '<leader>o', ':only<cr>', silent)

-- quickly select the text I just pasted.
map('n', 'gV', '`[v`]', silent)
