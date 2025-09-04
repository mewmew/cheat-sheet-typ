// === [ style ] ===============================================================

// use landscape mode and 2 columns.
#set page(
	paper: "a4",
	margin: (x: 0.5cm, y: 1cm),
	flipped: true, // landscape mode
	columns: 2,
)

// reproducible PDF
#set document(date: none)

// smaller text size
#set text(size: 10pt)

// small space between columns.
#set columns(gutter: 0.5cm)

// use "a, b" numbering for enum level two.
#set enum(numbering: "1)a)")

// italic quote
#show quote: emph

// default table style
#set table(
	stroke: 0.2pt,
	inset: 5pt,
	align: left+horizon,
	// make table header blue.
	fill: (_, y) => if y == 0 { blue.lighten(90%) },
)

// === [ document ] ============================================================

// --- [ title ] ---------------------------------------------------------------

#place(
	top + center,
	scope: "parent",
	float: true,
	text(
		font: "HK Grotesk",
		size: 3.1em,
		weight: "bold",
		fill: gradient.linear(rgb("#007aff"), rgb("#2ec7b2")),
	)[
		#link("https://github.com/mewmew/cheat-sheet-typ", "Typst cheat sheet")
	],
)

// -----------------------------------------------------------------------------

// place link show rule after title, so Typst cheat sheet link uses gradient.
#show link: it => {
	if type(it.dest) == str {
		set text(fill: blue)
		underline(offset: 3pt, it)
	} else {
		it
	}
}

// --- [ Terminal commands ] ---------------------------------------------------

#table(
	columns: (1fr, auto),
	rows: 0.9cm,
	table.header[*Command*][*Description*],
// ~~~ [ generate template ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```bash
typst init @local/pkg-name
```
	],
	[
generate project from template
	],
// ~~~ [ compile report to PDF ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```bash
typst watch report.typ
```
	],
	[
continuously compile report to PDF
	],
// ~~~ [ configure fonts ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```bash
typst watch --font-path=inc/fonts report.typ
```
	],
	[
add custom fonts
	],
)

// --- [ Shorthands ] ----------------------------------------------------------

//=== Thingamajiggles

#table(
	columns: (auto, auto, 1fr),
	table.header[*Shorthand*][*Output*][*Typst function*],
// ~~~ [ bullet list ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ numbered list ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ link ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
#link("https://typst.app/docs/reference/model/link/", "link function")

```typst
#link("https://7i.se", "7i")
```
	],
// ~~~ [ raw ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ heading ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ label ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ ref ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ mono ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
#raw("`mono`")
	],
	[`mono`],
	[
#link("https://typst.app/docs/reference/text/raw/", "raw function")
	],
// ~~~ [ bold ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```
*Bold text*
```
	],
	[#strong[Bold text]],
	[
#link("https://typst.app/docs/reference/model/strong", "strong function")
	],
// ~~~ [ italic ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```
_Italic text_
```
	],
	[#emph[Italic text]],
	[
#link("https://typst.app/docs/reference/model/emph", "emph function")
	],
// ~~~ [ symbols ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ line break ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

// --- [ Modes in Typst ] ------------------------------------------------------

#table(
	columns: (auto, auto, 1fr, auto),
	rows: 0.9cm,
	table.header[*Mode*][*Syntax*][*Example*][*Output*],
// ~~~ [ Markup ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ Code ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ Math ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

// --- [ Typst functions ] -----------------------------------------------------

#table(
	columns: (1fr, 1fr),
	table.header[*Typst function*][*Output*],
// ~~~ [ figure ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
	image("/inc/foo.png", width: 29%),
	caption: [Sunset.],
) <fig-foo>
	],
// ~~~ [ reference ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
See @fig-foo.
```
	],
	[
See @fig-foo.
	],
// ~~~ [ highlight ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#highlight[Highlighted text]
```
	],
	[#highlight[Highlighted text]],
// ~~~ [ footnote ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ underline ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#underline[Underlined text]
```
	],
	[#underline[Underlined text]],
// ~~~ [ coloured text ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#text(fill: blue)[Blue text]
```
	],
	[#text(fill: blue)[Blue text]],
// ~~~ [ text size ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#text(size: 2em)[Text size]
```
	],
	[#text(size: 2em)[Text size]],
// ~~~ [ strikethrough ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#strike[Stroken text]
```
	],
	[#strike[Stroken text]],
// ~~~ [ table ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#table(
	columns: 2,
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
// ~~~ [ page break ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
// ~~~ [ quote ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	[
```typst
#quote(
	attribution: [Unknown],
	block: true)["In the matrix of ones and zeros, a hacker is both creator and destroyer."]
```
	],
	[
#quote(attribution: [Unknown], block: true)["In the matrix of ones and zeros, a hacker is both creator and destroyer."]
	],
)
