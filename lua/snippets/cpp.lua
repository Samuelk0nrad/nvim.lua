local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("cp", {
    t({
      "// "
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "#define fast ios::sync_with_stdio(false); cin.tie(NULL);",
      "#define ll long long",
      "",
      "int main() {",
      "    fast",
      "",
      "    ",
    }),
    i(1, ""),
    t({
      "",
      "",
      "    return 0;",
      "}",
    }),
  }),
})
