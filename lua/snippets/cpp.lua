local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Main function
  s("main", {
    t({ "#include <iostream>", "", "using namespace std;", "", "int main() {", "  " }),
    i(1, "// Your code here"),
    t({ "", "  return 0;", "}" }),
  }),

  -- Standard include guard
  s("guard", {
    t("#ifndef "), i(1, "HEADER_NAME"), t({ "", "#define " }), i(2, "HEADER_NAME"),
    t({ "", "" }), i(3, "// Your declarations here"),
    t({ "", "", "#endif // " }), f(function(args) return args[1][1] end, {1}),
  }),

  -- For loop
  s("for", {
    t("for (int "), i(1, "i"), t(" = 0; "), i(2, "i"), t(" < "), i(3, "n"), t("; "), i(4, "i++"), t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- While loop
  s("while", {
    t("while ("), i(1, "condition"), t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- If-else statement
  s("ifelse", {
    t("if ("), i(1, "condition"), t({ ") {", "  " }),
    i(2, "// Code when true"),
    t({ "", "} else {", "  " }),
    i(3, "// Code when false"),
    t({ "", "}" }),
  }),

  -- Function definition
  s("func", {
    i(1, "return_type"), t(" "), i(2, "function_name"), t("("), i(3, "parameters"), t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Lambda function
  s("lambda", {
    t("[=]() { "), i(1, "// Your code here"), t(" };")
  }),

  -- Class definition
  s("class", {
    t("class "), i(1, "ClassName"), t({ " {", "public:" }),
    t({ "", "  " }), i(2, "// Public members"),
    t({ "", "private:" }),
    t({ "", "  " }), i(3, "// Private members"),
    t({ "", "};" }),
  }),

  -- Struct definition
  s("struct", {
    t("struct "), i(1, "StructName"), t({ " {", "  " }),
    i(2, "// Members"),
    t({ "", "};" }),
  }),

  -- Print to console
  s("cout", {
    t('std::cout << "'), i(1, "Message"), t('" << '), i(2, "variable"), t(' << std::endl;')
  }),

  -- Vector initialization
  s("vector", {
    t("std::vector<"), i(1, "type"), t("> "), i(2, "vecName"), t(";")
  }),

  -- Include statement
  s("inc", {
    t("#include <"), i(1, "header"), t(">")
  }),

  -- Namespace usage
  s("namespace", {
    t("using namespace "), i(1, "std"), t(";")
  }),

  -- Switch case
  s("switch", {
    t("switch ("), i(1, "expression"), t({ ") {", "  case " }),
    i(2, "value1"), t({ ":", "    " }), i(3, "// Code for case 1"),
    t({ "", "    break;", "  case " }), i(4, "value2"), t({ ":", "    " }),
    i(5, "// Code for case 2"),
    t({ "", "    break;", "  default:", "    " }), i(6, "// Default case"),
    t({ "", "}" }),
  }),

  -- Template
  s("template", {
    t({ "template <typename T>", "" }),
    t("T "), i(1, "function_name"), t("("), i(2, "parameters"), t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Constructor
  s("ctor", {
    t("explicit "), i(1, "ClassName"), t("("), i(2, "parameters"), t({ ") : " }),
    i(3, "initialization_list"),
    t({ " {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Destructor
  s("dtor", {
    t("~"), i(1, "ClassName"), t("() {"),
    t({ "", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Range-based for loop
  s("rfor", {
    t("for (auto& "), i(1, "element"), t(" : "), i(2, "container"), t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Pair initialization
  s("pair", {
    t("std::pair<"), i(1, "type1"), t(", "), i(2, "type2"), t("> "), i(3, "pairName"), t(";")
  }),

  -- Map initialization
  s("map", {
    t("std::map<"), i(1, "keyType"), t(", "), i(2, "valueType"), t("> "), i(3, "mapName"), t(";")
  }),

  -- Lambda with capture
  s("lamcap", {
    t("auto "), i(1, "lambdaName"), t(" = ["), i(2, "captures"), t("]() {"),
    t({ "", "  " }),
    i(0),
    t({ "", "};" }),
  }),
}

