#set page(
	margin: 0.5cm,
	flipped: true, // landscape mode
	columns: 2,
)

#set table(stroke: 0.2pt, inset: 5pt)
#set text(size: 8pt)
#show link: set text(fill: blue)
#show link: it => {
	underline(offset: 3pt, it)
}

#set table(
	// make table header blue.
	fill: (_, y) => if y == 0 {
		blue.lighten(90%)
	}
)

#grid(
	columns: (1fr, 1fr),
	[
= Cheat sheet for Typst

== Image with caption

As seen in @fig-foo ...

#figure(
	image("/inc/foo.png", width: 30%),
	caption: [Sunset.],
) <fig-foo>
	],
	[
```typst
= Cheat sheet for Typst

== Image with caption

As seen in @fig-foo ...

#figure(
	image("/inc/foo.png", width: 30%),
	caption: [Sunset.],
) <fig-foo>
```
	],
)

#table(
	columns: 3,
	table.header([*Shorthand*], [*Output*], [*Typst function*]),
	// bold
	[
```
*Bold text*
```
	],
	[#strong[Bold text]],
	[
```typst
#strong[Bold text]
```
	],
	// italic
	[
```
_Italic text_
```
	],
	[#emph[Italic text]],
	[
```typst
#emph[Italic text]
```
	],
	// link
	[
```
https://example.org
```
	],
	[
	#link("https://example.org")

	#link("https://typst.app/docs/reference/syntax/", "Typst syntax docs")
	],
	[
```typst
#link("https://example.org")

#link("https://typst.app/docs/reference/syntax/", "Typst syntax docs")
```
	],
	// bullet list
	[
```
- foo
	- bar
- baz
```
	],
	[
- foo
	- bar
- baz
	],
	[
```typst
#list[
	foo
	#list[bar]
][baz]
```
	],
	// numbered list
	[
```typst
+ foo
	+ one
	+ two
+ bar
```
	],
	[
+ foo
	+ one
	+ two
+ bar
	],
	[
```typst
#enum[
	foo
	#enum[one][two]
][bar]
```
	],
	// highlight
	[],
	[#highlight[Highlighted text]],
	[
```typst
#highlight[Highlighted text]
```
	],
	// raw
	[
#raw("```python
print('foo')
```")
	],
	[
```python
print('foo')
```

#raw(read("/inc/hello.py"), block: true, lang: "python")
],
	[
#raw("#raw(\"print('foo')\", block: true, lang: \"python\")", lang: "typst")

#raw("#raw(read(\"/inc/hello.py\"), block: true, lang: \"python\")", lang: "typst")
	],
	// strikethrough
	[],
	[#strike[Stroken text]],
	[
```typst
#strike[Stroken text]
```
	],
	// footnote
	[],
	[A footnote#footnote[foo].],
	[
```typst
#footnote[foo]
```
	],
	// coloured text
	[
```typst
#text(blue)[Blue text]
```
	],
	[#text(fill: blue)[Blue text]],
	[
```typst
#text(fill: blue)[Blue text]
```
	],
	// large font
	[],
	[#text(size: 2em)[Large text]],
	[
```typst
#text(size: 2em)[Large text]
```
	],
	// small font
	[],
	[#text(size: 0.6em)[Small text]],
	[
```typst
#text(size: 0.6em)[Small text]
```
	],
	// underline
	[],
	[#underline[Underlined text]],
	[
```typst
#underline[Underlined text]
```
	],
)

= Tables

#grid(
	columns: (auto, 1fr),
	gutter: 3em,
	[
#table(
	columns: 2,
	// table headers repeat past pages and columns.
	table.header[*name*][*desc*],
	[a], [b],
	[c], [d],
)

	],
	[
```typst
#table(
	columns: 2,
	// table headers repeat past pages and columns.
	table.header[*name*][*desc*],
	// table cells.
	[a], [b],
	[c], [d],
)
```
	],
)

= Modes

There are three syntactical #emph[modes] in Typst: #strong[markup], #strong[math] and #strong[code]. Markup is the default mode.

#table(
	columns: 4,
	table.header[*Switch mode*][*Syntax*][*Example*][*Output*],
	// Code
	[Code],
	[
```typst
Prefix code with #
```
	],
	[
```typst
Result: #(30 + 12)
```
	],
	[
Result: #(30 + 12)
	],
	// Math
	[Math],
	[
```typst
Surround equations with $..$
```
	],
	[
```typst
$ sqrt(x^2 + y^2) = z $
```
	],
	[
$ sqrt(x^2 + y^2) = z $
	],
	// Markup
	[Markup],
	[
```typst
Surround markup with [..]
```
	],
	[
```typst
// use Markup mode as data in
// Code mode.
#let desc = [*test* ing]
```
	],
	[
#let desc = [*test* ing]
#desc
	],
)
