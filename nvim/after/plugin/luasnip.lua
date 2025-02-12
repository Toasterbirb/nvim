local ls = require("luasnip")
local types = require("luasnip.util.types")
ls.setup()

ls.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

-- c++ snippets
ls.add_snippets("cpp", {
	-- #pragma once with namespace
	ls.parser.parse_snippet("#pragma once", "#pragma once\n\nnamespace ${1}\n{\n\n}"),

	-- create a class with a name
	ls.parser.parse_snippet(
		"class",
		"class ${1}\n{\npublic:\n\t${1}();\n\t~${1}() = default;\n\t${1}(const ${1}&) = default;\n\t${1}(${1}&) = default;\n\t${1}(${1}&&) = default;\n\nprivate:\n\n};"
	),

	-- create a new function that returns void
	ls.parser.parse_snippet("void", "void ${1}()\n{\n\n}"),

	-- default main function
	ls.parser.parse_snippet("int main", "int main(void)\n{\n\t${1}\n\treturn 0;\n}"),

	-- namespace
	ls.parser.parse_snippet("name", "namespace ${1}\n{\n\n}"),

	-- attribute
	ls.parser.parse_snippet("__", "__attribute__((${1}))"),

	-- struct
	ls.parser.parse_snippet("struct", "struct ${1}\n{\n\t\n};"),
})

-- sh
ls.add_snippets("sh", {
	-- DESTDIR installation in seed files
	ls.parser.parse_snippet("DESTDIR", 'DESTDIR="$$FAKEROOT/$$NAME"'),
})

-- neorg
ls.add_snippets("norg", {
	-- document metadata
	ls.parser.parse_snippet("@docu", "@document.meta\ntitle: ${1} \n@end"),
})

-- LaTeX snippets
ls.add_snippets("tex", {
	-- figure
	ls.parser.parse_snippet(
		"@fig",
		"\\begin{figure}[!htb]\n\t\\centering\n\t\\includegraphics[totalheight=6cm]{${1}}\n\t\\caption{${2}}\n\t\\label{fig:${3}}\n\\end{figure}\n"
	),
})
