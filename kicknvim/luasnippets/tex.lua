local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({ trig = "frame", dscr = "Insert a beamer frame" },
    fmta(
      [[
    \begin{frame}{<>}
      <>
    \end{frame}
  ]],
      {
        i(1, "title"),
        i(2, "content")
      }
    )
  ),

  s({ trig = "block", dscr = "Insert a beamer block" },
    fmta(
      [[
    \begin{block}{<>}
      <>
    \end{block}
  ]],
      {
        i(1, "title"),
        i(2, "content")
      }
    )
  ),

  s({ trig = "pp", dscr = "Insert a beamer pause" },
    fmt("\\pause", {})
  ),

  s({ trig = "ii", dscr = "Insert an item" },
    fmt("\\item ", {})
  ),

  s({ trig = "ss", dscr = "Insert a small skip" },
    fmt("\\smallskip", {})
  ),

  s({ trig = "ms", dscr = "Insert a medium skip" },
    fmt("\\medskip", {})
  ),

  s({ trig = "bs", dscr = "Insert a big skip" },
    fmt("\\bigskip", {})
  ),

  s({ trig = "tw", dscr = "Insert \\textwidth" },
    fmt("\\textwidth", {})
  ),

  s({ trig = "th", dscr = "Insert \\textheight" },
    fmt("\\textheight", {})
  ),
}
