# Theorems and references (`latex-pro-theorems.sty`)

Loaded by `\usepackage{latex-pro}`, or on its own with `\usepackage{latex-pro-theorems}` (accepts `[bysection]`).

The package defines numbered environments for **theorem, proposition, lemma,
corollary, definition, exercise, example** and **remark** (one shared counter,
so you get Theorem 1, Lemma 2, Proposition 3, …). The command with the same
name writes the reference, with the name in small caps and the number in bold:

```latex
\begin{proposition}\label{prop:main}
  ...
\end{proposition}

By \proposition{prop:main} and \exercise{ex:limits} ...   % "Proposition 1", "Exercise 4"
See \theorem{3.2} in the course notes.                     % a number is written as is
```

| Command | Result |
| --- | --- |
| `\proposition{label}` | <span style="font-variant:small-caps">Proposition</span> **3** (number taken from the label) |
| `\proposition{3}` | <span style="font-variant:small-caps">Proposition</span> **3** (plain number written as is) |
| `\theorem{…}` `\lemma{…}` `\corollary{…}` `\definition{…}` `\exercise{…}` `\example{…}` `\remark{…}` | the same for each kind |

Notes:

- An unknown label shows **Proposition ??** with the usual LaTeX warning;
  compile twice as for any `\ref`.
- With `hyperref` loaded, the whole reference is a link.
- Change the look with `\latexprorefstyle` (the name) and `\latexprorefnumstyle`
  (the number), e.g. `\renewcommand\latexprorefnumstyle[1]{#1}` for a plain number.
- `\usepackage[bysection]{latex-pro}` numbers them per section: 2.1, 2.2, …
- Change the printed words with e.g. `\renewcommand\exercisename{Opgave}`.
- Since the package defines these environments, remove any
  `\newtheorem{proposition}{…}` (etc.) lines from your own preamble.

## References to the book

Sections, chapters and equations of the book are written in the same style.
The argument is always printed as is, so anything works: `2.3`, `A.2`,
`3.1a`, `b`. To point at a label of your own document, pass its number with
`\Ref*` (or `\ref`):

```latex
By \booksection{2.3} and \bookeq{3.12} ...   % "Section 2.3", "Equation (3.12)"
See \bookchapter{4} and \booksection{b}.      % "Chapter 4", "Section b"
As in \bookeq{\Ref*{eq:main}}.               % "Equation (2)", from a label
```

| Command | Result |
| --- | --- |
| `\booksection{2.3}` | <span style="font-variant:small-caps">Section</span> **2.3** |
| `\bookchapter{4}` | <span style="font-variant:small-caps">Chapter</span> **4** |
| `\bookeq{3.12}`, `\bookeq{(3.12)}` | <span style="font-variant:small-caps">Equation</span> **(3.12)** |
| `\bookeq{\Ref*{eq:main}}` | the same with the number of your own label |

Notes:

- Change the words with `\renewcommand\booksectionname{Afsnit}`,
  `\bookchaptername` and `\bookeqname`.
- The theorem references (`\theorem{…}` etc.) also take `\ref*{…}` now, and
  their typed numbers may be `A.2` or `3.1a`.

Examples: [`examples/theorems.tex`](../examples/theorems.tex). Tests: [`tests/test-theorems.tex`](../tests/test-theorems.tex).
