local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s("log", { t("console.log('"), i(1, "Message"), t(":', "), i(2, "variable"), t(");") }),
  s("func", { t("const "), i(1, "name"), t(" = ("), i(2, "params"), t(") => {"), t({ "", "  " }), i(0), t({ "", "};" }) }),
  s("fetch", {
    t("async function "), i(1, "fetchData"), t("() {"),
    t({ "", "  try {" }),
    t({ "", "    const response = await fetch('" }), i(2, "https://api.example.com/endpoint"), t("');"),
    t({ "", "    const data = await response.json();" }),
    t({ "", "    console.log(data);" }),
    t({ "", "  } catch (error) {" }),
    t({ "", "    console.error('Error:', error);" }),
    t({ "", "  }" }),
    t({ "", "}" }),
  }),
  -- For loop
  s("for", {
    t("for (let "), i(1, "i"), t(" = 0; "), i(2, "i"), t(" < "), i(3, "array.length"), t("; "), i(4, "i++"), t(") {"),
    t({ "", "  " }), i(0),
    t({ "", "}" }),
  }),
  -- ForEach loop
  s("foreach", {
    i(1, "array"), t(".forEach(("), i(2, "item"), t(") => {"),
    t({ "", "  " }), i(0),
    t({ "", "});" }),
  }),
  -- If statement
  s("if", {
    t("if ("), i(1, "condition"), t(") {"),
    t({ "", "  " }), i(0),
    t({ "", "}" }),
  }),
  -- Try-catch block
  s("trycatch", {
    t("try {"),
    t({ "", "  " }), i(1, "tryBlock"),
    t({ "", "} catch (error) {" }),
    t({ "", "  console.error('Error:', error);" }),
    t({ "", "}" }),
  }),
  -- Class definition
  s("class", {
    t("class "), i(1, "ClassName"), t(" {"),
    t({ "", "  constructor(" }), i(2, "args"), t(") {"),
    t({ "", "    " }), i(3, "constructorBody"),
    t({ "", "  }" }),
    t({ "", "" }),
    t({ "", "  " }), i(0),
    t({ "", "}" }),
  }),
  s("arrow", {
    t("("), i(1, "params"), t(") => {"),
    t({ "", "  return " }), i(2, "value"), t(";"),
    t({ "", "}" }),
  }),
}
