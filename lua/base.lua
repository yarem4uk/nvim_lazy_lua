local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = ' '

cmd('autocmd!')

cmd('source ~/.config/nvim/abbr.vim')

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.title = true
opt.ttyfast = true
opt.lazyredraw = true
opt.shell = '/bin/zsh'

opt.undofile = true
cmd('set undodir=~/.config/nvim/.backups')
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.wrap = true
opt.linebreak = true
opt.showcmd = true
opt.showmatch = true
opt.joinspaces = false
opt.swapfile = false

opt.showmode = false
opt.cursorline = true

opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

opt.foldmethod = 'indent'
opt.foldlevelstart = 99

opt.path:append({ '**' })
opt.wildignore:append({ '*/node_modules/*' })

-- vim.api.nvim_create_autocmd('IsertLeave', {
--   pattern = '*',
--   command = 'set nopaste'
-- })

opt.formatoptions:append({ 'r' })

-- opt.t_Co=256
opt.hls = false
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 2

opt.termguicolors = true

-- everforest
-- g.everforeset_background = 'medium'
-- g.everforest_transparent_background = 1

-- gruvbox-material
-- g.gruvbox_material_background = 'soft'
-- g.gruvbox_material_transparent_background = 1

cmd([[
  au BufNewFile,BufRead *.ejs set ft=html
  au BufNewFile,BufRead *.jsx set ft=javascript
  au BufNewFile,BufRead *.rasi set ft=css

  autocmd bufread,bufnewfile *.py setl sts=4 sw=4 tw=79 cc=79
  autocmd bufread,bufnewfile *.html setl sts=2 sw=2 tw=79
]])

cmd([[command! Curl set splitright | vnew | set filetype=json | read !sh #]])
