local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("heex", {
    s("pe", {
        t('<%= '),
        i(1),
        t(' %>')
    }),
    s("er", {
        t('<% '),
        i(1),
        t(' %>')
    }),
})
