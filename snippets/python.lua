local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  return
end

local s = ls.s

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local i = ls.insert_node

-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- local f = ls.function_node
-- local sn = ls.snippet_node

-- Repeats a node
-- rep(<position>)
local rep = require('luasnip.extras').rep

ls.add_snippets('python', {
  s('print', fmt("print('{}:', {}){}", { i(1), i(2), i(0) })),
  s('iff', fmt('if {}:\n    {}', { i(1, 'true'), i(0) })),
  s('fn', fmt('def {}({}):\n    {}', { i(1, 'name'), i(2), i(3, 'pass') })),
}, {
  type = 'autosnippets',
})
