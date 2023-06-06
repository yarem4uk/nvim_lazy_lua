local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  return
end
-- This is a snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s
-- This is a format node.
-- It takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

-- This is an insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node
local t = ls.text_node

-- local d = ls.dynamic_node
-- local c = ls.choice_node
local f = ls.function_node
-- local sn = ls.snippet_node

-- Repeats a node
-- rep(<position>)
-- local rep = require("luasnip.extras").rep

ls.add_snippets('all', {
  s(
    { trig = '(%w*[^douiI])mm', wordTrig = false, regTrig = true, hidden = true },
    fmta('<><><>', {
      f(function(_, snip)
        return snip.captures[1] .. '['
      end),
      i(1),
      t(']'),
    })
  ),

  s(
    { trig = '(%w*)jj', wordTrig = false, regTrig = true, hidden = true },
    fmta('<><><>', {
      f(function(_, snip)
        return snip.captures[1] .. '('
      end),
      i(1),
      t(')'),
    })
  ),

  s(
    { trig = '(%w*)MM', wordTrig = false, regTrig = true, hidden = true },
    fmta('<><><>', {
      f(function(_, snip)
        return snip.captures[1] .. '{'
      end),
      i(1),
      t('}'),
    })
  ),

  s({ trig = '([^%a])dmm', wordTrig = false, regTrig = true, hidden = false }, fmt('[[{}]]{}', { i(1), i(0) })),
  s({ trig = '%.or', regTrig = true, hidden = true }, fmt('|| {}', { i(0) })),
  s({ trig = '%.and', regTrig = true, hidden = true }, fmt('&& {}', { i(0) })),

  s(
    { trig = '(%w+(.%w+))(%.dd)', regTrig = true, hidden = false },
    f(function(_, snip)
      return '{ ' .. snip.captures[1] .. ' }'
    end)
  ),
}, {
  type = 'autosnippets',
})

ls.add_snippets('lua', {
  s('fn', fmt('function({})\n  {}\nend', { i(1), i(2, 'pass') })),
  s('print', fmt("print('{}:', {}){}", { i(1), i(2), i(0) })),
}, {
  type = 'autosnippets',
})
