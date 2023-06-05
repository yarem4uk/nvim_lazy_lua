local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
  return
end

require("mason").setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

local servers = {
  html = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
    },
  },
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})
