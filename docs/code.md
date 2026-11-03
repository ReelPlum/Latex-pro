# Code and pseudocode (`latex-pro-code.sty`)

Loaded by `\usepackage{latex-pro}`, or on its own with `\usepackage{latex-pro-code}`.

Include a file from your project as highlighted code. Both use `listings`,
so they work with plain `pdflatex` (no `-shell-escape` needed). Paths are
relative to the main `.tex` file.

```latex
\python{code/solve.py}                       % Python, with line numbers
\python[caption={Newton's method}]{newton.py}
\python[firstline=10, lastline=25]{solve.py} % only part of the file
\python*{solve.py}                           % no line numbers
\pseudo{algorithms/search.txt}               % pseudocode
```

| Command | Result |
| --- | --- |
| `\python[opts]{file.py}` | the file as syntax-highlighted Python in a light grey box |
| `\python*{file.py}` | the same without line numbers |
| `\begin{pythoncode} ... \end{pythoncode}` | Python typed straight into the `.tex` file, same look |
| `\py{x = 1}` | a short piece of Python inline in a sentence |
| `\pseudo[opts]{file.txt}` | a plain-text pseudocode file, highlighted and indented |
| `\pseudo*{file.txt}` | the same without line numbers |
| `\pseudoindentfalse` | from here on, keep the file's own indentation (`\pseudoindenttrue` turns it back on) |

`opts` is any `listings` option: `caption`, `label`, `firstline`,
`lastline`, `numbers=none`, `basicstyle=\footnotesize\ttfamily`, …

What `\pseudo` does with the file:

- **Keywords in bold**, case-insensitive: `function procedure algorithm
  return if then else elseif end for foreach each to downto by step do in
  while repeat until loop break continue and or not true false null print
  input output let call begin …`. `// …` and `/* … */` are comments.
- **Maths.** TeX commands are typeset as maths, so `x \geq y`, `s \gets 0`,
  `\alpha_i^2`, `\epsilon` come out as symbols. `<=`, `>=`, `!=`, `<-`,
  `->`, `<`, `>` and `*` become ≤ ≥ ≠ ← → < > ·, and single-letter
  subscripts like `a_i` or `a_{n+1}` are set as maths. A line that already
  contains `$…$` is left exactly as written (your own maths).
- **Automatic indentation.** You can write every line flush left. After a
  line starting with `function`/`procedure`/`repeat`/`else`, or ending in
  `then`/`do`/`:`/`{`, or a `for`/`foreach`/`while`/`if` header, the next
  lines are indented. Lines starting with `end` (`end if`, `endfor`, …),
  `else`, `else if`, `until` or `}` step back out. A one-liner such as
  `if s = 3 then break` does not open a block.

Example `search.txt`:

```text
function hello_world(x, y)
if (x \geq y) then
print(y)
return x
else if (x < y) then
print(y)
return y
end
for i = 1 to n do
s <- s + a_i
end for
```

Notes:

- `\pseudo` writes the re-indented copy to `<jobname>-pseudo.tmp` next to
  your PDF; it is safe to delete.
- The package loads `listings`, and `xcolor` at `\begin{document}` if you
  have not loaded it yourself, so `\usepackage[dvipsnames]{xcolor}` etc. still
  works anywhere in your preamble.
- Common non-ASCII letters (æ ø å ä ö ü é ß, – — “ ” …) in the code and
  comments are handled under pdflatex. Other unusual characters in a file
  need an extra `literate` entry.
- Change the look of every listing with e.g.
  `\lstdefinestyle{latexpro-python}{...}` or `latexpro-pseudo` after
  loading the package.

Examples: [`examples/code.tex`](../examples/code.tex). Tests: [`tests/test-code.tex`](../tests/test-code.tex).
