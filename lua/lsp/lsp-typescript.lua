require('typescript-tools').setup({
  on_attach = require('lsp.handlers').on_attach(),
})

local api = require('typescript-tools.api')

require('typescript-tools').setup({
  handlers = {
    ['textDocument/publishDiagnostics'] = api.filter_diagnostics(
    -- Ignore 'This may be converted to an async function' diagnostics.
      { 6133, 7044 }
    ),
  },
})
