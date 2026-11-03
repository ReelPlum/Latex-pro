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

Sections, chapters and equations of the book (or of your own document, by
label) are written in the same style:

```latex
By \booksection{2.3} and \bookeq{3.12} ...   % "Section 2.3", "Equation (3.12)"
See \bookchapter{4} and \booksection{A.2}.
As in \booksection{sec:intro}.               % a label of your own document
```

| Command | Result |
| --- | --- |
| `\booksection{2.3}` | <span style="font-variant:small-caps">Section</span> **2.3** |
| `\bookchapter{4}` | <span style="font-variant:small-caps">Chapter</span> **4** |
| `\bookeq{3.12}`, `\bookeq{(3.12)}` | <span style="font-variant:small-caps">Equation</span> **(3.12)** |
| `\booksection{sec:intro}`, `\bookeq{eq:main}` | the same, number taken from a label |

Notes:

- A typed number can be `3`, `4.2`, `2.3.1`, an appendix `A.2` or a
  sub-equation `3.1a`. This also holds for `\theorem{A.1}` etc.
- Change the words with `\renewcommand\booksectionname{Afsnit}`,
  `\bookchaptername` and `\bookeqname`.

Examples: [`examples/theorems.tex`](../examples/theorems.tex). Tests: [`tests/test-theorems.tex`](../tests/test-theorems.tex).
