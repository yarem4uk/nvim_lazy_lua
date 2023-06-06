local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },

  { 'tpope/vim-sensible' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-commentary' },

  --themes
  { 'sainnhe/everforest' },

  -- tree
  { 'nvim-tree/nvim-tree.lua', version = 'nightly' },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  --lualine
  { 'nvim-lualine/lualine.nvim' },

  -- lsp configurations
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
  },

  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion cmp
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },


  -- formating & linting
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'jay-babu/mason-null-ls.nvim' },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- version = "<CurrentMajor>.*",
    -- build = "make install_jsregexp",
  },

  -- Toggleterminal
  { 'akinsho/toggleterm.nvim', version = "*", config = true },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
})
