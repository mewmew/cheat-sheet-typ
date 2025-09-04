#set page(
	paper: "a4",
	margin: 0.5cm,
	flipped: true, // landscape mode
	columns: 2,
)

#set columns(gutter: 0.5cm)

#set table(align: left+horizon)

#show quote: emph

#set table(stroke: 0.2pt, inset: 5pt)
#set text(size: 10pt)
#show link: it => {
	if type(it.dest) == str {
		set text(fill: blue)
		underline(offset: 3pt, it)
	} else {
		it
	}
}

#set table(
	// make table header blue.
	fill: (_, y) => if y == 0 {
		blue.lighten(90%)
	}
)

//= Terminal commands

#align(
	horizon
)[

#table(
	columns: (1fr, auto),
	rows: 0.9cm,
	table.header[*Command*][*Desription*],
	// generate template
	[
```bash
typst init @local/pkg-name
```
	],
	[
generate project from template
	],
	// compile report to PDF
	[
```bash
typst watch report.typ
```
	],
	[
continuously compile report to PDF
	],
	// configure fonts
	[
```bash
typst watch --font-path=inc/fonts report.typ
```
	],
	[
add custom fonts
	],
)

//#v(0.1mm)
//=== Thingamajiggles

#place(dx: 10pt, dy: 10pt)[#line(length: 5cm, stroke: 1pt)]

#table(
	columns: (auto, auto, 1fr),
	table.header([*Shorthand*], [*Output*], [*Typst function*]),
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
#link("https://typst.app/docs/reference/model/list/", "list function")
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
#link("https://typst.app/docs/reference/model/enum/", "enum function")
	],
	// link
	[
```
https://example.org
```
	],
	[
	#link("https://example.org")

	#link("https://7i.se", "7i")
	],
	[
```typst
#link("https://example.org")

#link("https://7i.se", "7i")
```
	],
	// raw
	[
#raw("```python
print('hello world')
```")
	],
	[
```python
print('hello world')
```
],
	[
#raw("#raw(read(\"/inc/hello.py\"),\nblock: true, lang: \"python\")", lang: "typst")
	],
	// heading
	[
```
= Heading one

== Heading two
```
	],
	[
#set heading(numbering: "1.1")
= Heading one

== Heading two
	],
	[
#link("https://typst.app/docs/reference/model/heading/", "heading function")
	],
	// label
	[
```
=== Qwerty
<sec-ref-heading>
```
	],
	[
#set heading(numbering: "1.1")
=== Qwerty
<sec-ref-heading>
	],
	[
#link("https://typst.app/docs/reference/foundations/label/", "label function")
	],
	// ref
	[
```
See @sec-ref-heading.
```
	],
	[
See @sec-ref-heading.
	],
	[
#link("https://typst.app/docs/reference/model/ref/", "ref function")
	],
	// mono
	[
#raw("`mono`")
	],
	[`mono`],
	[
#link("https://typst.app/docs/reference/text/raw/", "raw function")
	],
	// bold
	[
```
*Bold text*
```
	],
	[#strong[Bold text]],
	[
#link("https://typst.app/docs/reference/model/strong", "strong function")
	],
	// italic
	[
```
_Italic text_
```
	],
	[#emph[Italic text]],
	[
#link("https://typst.app/docs/reference/model/emph", "emph function")
	],
	// symbols
	[
```
$-->$
...
#sym.checkmark
```
	],
	[
$-->$ ... #text(size: 1.5em)[#sym.checkmark]
	],
	[
#link("https://typst.app/docs/reference/symbols/sym/", "symbols list")
	],
	// line break (TODO: remove?)
	[
```
\
```
	],
	[
```typst
// line break
```
	],
	[
#link("https://typst.app/docs/reference/text/linebreak/", "linebreak function")
	]
)

#colbreak()

//= Modes in Typst

//There are three #emph[modes] in Typst: #strong[markup], #strong[math] and #strong[code]. Markup is the default mode.

#table(
	columns: (auto, auto, 1fr, auto),
	rows: 0.9cm,
	table.header[*Mode*][*Syntax*][*Example*][*Output*],
	// Markup
	[
#link("https://typst.app/docs/reference/syntax/#markup", "Markup")
	],
	[
```typst
// default mode
Surround markup with [..]
```
	],
	[
```typst
// use Markup in Code.
#let desc = [*test* ing]
```
	],
	[
#let desc = [*test* ing]
#desc
	],
	// Code
	[
#link("https://typst.app/docs/reference/syntax/#code", "Code")
	],
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
	[
#link("https://typst.app/docs/reference/syntax/#math", "Math")
	],
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
)


#table(
	columns: (1fr, 1fr),
	table.header[*Typst function*][*Output*],
	// figure
	[
```typst
#figure(
	image("/inc/foo.png", width: 30%),
	caption: [Sunset.],
) <fig-foo>
```
	],
	[
#figure(
	image("/inc/foo.png", width: 30%),
	caption: [Sunset.],
) <fig-foo>
	],
	// reference
	[
```typst
See @fig-foo.
```
	],
	[
See @fig-foo.
	],
	// highlight
	[
```typst
#highlight[Highlighted text]
```
	],
	[#highlight[Highlighted text]],
	// footnote
	[
```typst
#footnote[foo]
```
	],
	[
	//A footnote#footnote[foo].
	A footnote#super[#link(<foot-one>, "1")]<foot-backlink>.
	#line(length: 50%, stroke: 0.5pt)
	#v(-0.3cm)
	#h(0.2cm)#text(size: 0.85em)[#super[#link(<foot-backlink>, "1")]<foot-one>foo]
	],
	// underline
	[
```typst
#underline[Underlined text]
```
	],
	[#underline[Underlined text]],
	// coloured text
	[
```typst
#text(fill: blue)[Blue text]
```
	],
	[#text(fill: blue)[Blue text]],
	// large font
	[
```typst
#text(size: 2em)[Text size]
```
	],
	[#text(size: 2em)[Text size]],
	// strikethrough
	[
```typst
#strike[Stroken text]
```
	],
	[#strike[Stroken text]],
	// table
	[
```typst
#table(
	columns: (1fr, 1fr),
	table.header[*name*][*desc*],
	[a], [b],
	[c], [d],
)
```
	],
	[
#table(
	columns: 2,
	table.header[*name*][*desc*],
	[a], [b],
	[c], [d],
)
	],
	// page break
	[
```typst
#pagebreak(weak: true)
```
	],
	[
```typst
// non-empty page break
```
	],
	// quote
	[
```typst
#quote(
	attribution: [Unknown],
	block: true)["In the matrix of ones and zeros, a hacker is both creator and destroyer."]
```
#v(0.63mm) // this is not a HACK :)
	],
	[
#quote(attribution: [Unknown], block: true)["In the matrix of ones and zeros, a hacker is both creator and destroyer."]
	],
)
]
