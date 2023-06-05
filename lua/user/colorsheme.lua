-- local color = 'gruvbox-material'
local color = 'everforest'

local status_ok, _ = pcall(vim.cmd, 'colo ' .. color)
if not status_ok then
  vim.notify('colorsheme ' .. color .. ' not found!')
  return
end

-- vim.fn.sign_define({
--   {
--     name = 'DiagnosticSignError',
--     text = 'E',
--     texthl = 'DiagnosticSignError',
--     linehl = 'ErrorLine',
--   },
--   {
--     name = 'DiagnosticSignWarn',
--     text = 'W',
--     texthl = 'DiagnosticSignWarn',
--     linehl = 'WarningLine',
--   },
--   {
--     name = 'DiagnosticSignInfo',
--     text = 'I',
--     texthl = 'DiagnosticSignInfo',
--     linehl = 'InfoLine',
--   },
--   {
--     name = 'DiagnosticSignHint',
--     text = 'H',
--     texthl = 'DiagnosticSignHint',
--     linehl = 'HintLine',
--   },
-- })
