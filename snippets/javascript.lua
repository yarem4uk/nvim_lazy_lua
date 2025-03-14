local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  return
end

local s = ls.s

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local i = ls.insert_node
local t = ls.text_node

local d = ls.dynamic_node
-- local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

-- Repeats a node
-- rep(<position>)
local rep = require('luasnip.extras').rep

local try = function()
  return sn(nil, { t('event') })
end

ls.add_snippets('javascript', {

  -- console.log
  s('console', fmt("console.log('{}:', {}){}", { i(1), i(2), i(0) })),

  -- export default
  s('edf', fmta('export default (<>) <> {\n  <>\n}<>', { i(1), t('=>'), i(2, 'statement'), i(0) })),

  -- iff
  s('iff', fmta('if (<>)\n    <>\n}\n\n<>', { i(1, 'condition'), i(2), i(0) })),

  -- try
  s('try', fmta('try {\n    <>\n} catch (<>) {\n    <>\n}<>', { i(1), i(2, 'error'), i(3, 'console.error()'), i(0) })),

  -- preventDefault
  s('prevent', fmt('{}.preventDefault()', { i(1, 'e') })),

  -- addEventListener
  s(
    { trig = '(%w+)%.event', regTrig = true, wordTrig = false, hidden = true },
    fmta('<>.addEventListener(<><><>, (<>) <> {\n  <>\n})<>', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("'"),
      d(1, function(_, snip)
        if snip.captures[1] == 'form' then
          return sn(1, i(1, 'submit'))
        end
        return sn(1, i(1, 'click'))
      end),
      t("'"),
      i(2, 'e'),
      t('=>'),
      i(3),
      i(0),
    })
  ),

  -- simple function
  s(
    { trig = 'fn', regTrig = true, hidden = true },
    fmta('const <> = (<>) <> {\n  <>\n<>}', { i(1, 'name'), i(2), t('=>'), i(3, 'statement'), i(0) })
  ),
  --call back
  s(
    { trig = 'clb', regTrig = true, hidden = true },
    fmta('(<>) <> {\n  <>\n<>}', { i(1), t('=>'), i(2, 'statement'), i(0) })
  ),
  --async call back
  s(
    { trig = 'cla', regTrig = true, hidden = true },
    fmta('async (<>) <> {\n  <>\n<>}', { i(1), t('=>'), i(2, 'statement'), i(0) })
  ),
  -- map
  s(
    { trig = '(%w+)%.map', regTrig = true, hidden = true },
    fmta('<>.map((<>) <> {\n  <>\n})\n<>', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, 'item'),
      t('=>'),
      i(2),
      i(0),
    })
  ),
  -- forEach
  s(
    { trig = '(%w+)%.for', regTrig = true, hidden = true },
    fmta('<>.forEach((<>) <> {\n  <>\n})\n<>', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, 'el'),
      t('=>'),
      i(2),
      i(0),
    })
  ),
}, {
  type = 'autosnippets',
})
