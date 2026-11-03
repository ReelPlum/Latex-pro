# Latex-pro

A personal LaTeX library of maths shortcut commands, packaged as
`latex-pro.sty`.

## Install

**Option A, install once for every project (recommended).** Copy (or symlink)
`latex-pro.sty` into your personal texmf tree, then use
`\usepackage{latex-pro}` anywhere.

| System | Folder |
| --- | --- |
| Windows (MiKTeX) | any folder you add under *MiKTeX Console → Settings → Directories*, inside `tex/latex/latex-pro/`, then *Tasks → Refresh file name database* |
| Windows / Linux (TeX Live) | `~/texmf/tex/latex/latex-pro/` (find it with `kpsewhich -var-value TEXMFHOME`) |
| macOS (MacTeX) | `~/Library/texmf/tex/latex/latex-pro/` |

A symlink means `git pull` in this repo updates every project at once.

**Option B, per project.** Put `latex-pro.sty` next to your `.tex` file.

## Commands

| Command | Result |
| --- | --- |
| `\bmat{1 & 2 \\ 3 & 4}` | matrix in square brackets (`bmatrix`) |
| `\mat{1 & 2 \\ 3 & 4}` | matrix in the current bracket style (round by default) |
| `\usematb`, `\usematp` | switch `\mat` and every matrix command to square / round brackets |
| `\pmat{a & b \\ c & d}` | matrix in round brackets (`pmatrix`) |
| `\partialdiff[f]{x}` | ∂f/∂x |
| `\partialdiff[f]{x,y}` | ∂²f/∂x∂y |
| `\partialdiff[f]{x,x}` | ∂²f/∂x² |
| `\partialdiff[f]{x,x,y}` | ∂³f/∂x²∂y |
| `\partialdiff{t}` | ∂/∂t (operator, no function) |
| `\hessian{3}` | the 3×3 Hessian of f at v, every entry ∂²f(v)/∂xᵢ∂xⱼ written out |
| `\hessian{n}` | the general n×n Hessian with ⋯ ⋮ ⋱ |
| `\hessian[g][y]{2}` | Hessian of g in variables y₁, y₂ |
| `\hessian[f][x][\mathbf{a}]{2}` | Hessian of f at the point **a** |
| `\hessian[f][x][]{2}` | Hessian with no point, entries ∂²f/∂xᵢ∂xⱼ |
| `\idmat{3}` | the 3×3 identity matrix, written out |
| `\idmat{n}` | the general n×n identity matrix with ⋯ ⋮ ⋱ |
| `\diff[f]{x}`, `\diff[f]{x,x}` | df/dx, d²f/dx² (same rules as `\partialdiff`, upright d) |
| `\gradient{3}` | gradient ∇f(v) as a row vector (∂f(v)/∂x₁ ⋯ ∂f(v)/∂x₃), as in the IMO26 notes |
| `\gradient[g][y][]{n}` | general gradient of g in y₁,…,yₙ, no point |
| `\jacobian{2}{3}` | 2×3 derivative matrix f′(v), entries ∂fᵢ(v)/∂xⱼ |
| `\jacobian[f][x][]{m}{n}` | general m×n derivative matrix, no point |
| `\colvec{n}`, `\colvec[v]{3}` | column vector (x₁,…,xₙ) / (v₁,v₂,v₃) |
| `\rowvec[w]{4}` | row vector [w₁ w₂ w₃ w₄] |
| `\rowvec[x,y]`, `\rowvec[1, 2]` | row vector with exactly those entries, printed with commas: (x, y), (1, 2) |
| `\colvec[x, y, z]` | column vector with exactly those entries |
| `\genmat{m}{n}`, `\genmat[b]{2}{3}` | general matrix with entries aᵢⱼ |
| `\symmat{n}`, `\symmat[s]{3}` | general symmetric matrix, aᵢⱼ above the diagonal and mirrored below |
| `\symmat{e & 0 \\ 0 & d}` | symmetric matrix from all its rows |
| `\symmat{1 & 2 & 3 \\ 4 & 5 \\ 6}` | symmetric matrix from its upper triangle (row by row, diagonal included) |
| `\symmat[e,d]{2}` | diagonal matrix with e, d on the diagonal and 0 elsewhere |
| `\symmat[d_1,d_2,d_n]{n}` | general diagonal matrix (entries for rows 1, 2 and n) |
| `\diagmat{e, d}` | same as `\symmat[e,d]{2}`, size taken from the list |
| `\N \Z \Q \R` | ℕ ℤ ℚ ℝ |
| `\norm{x}`, `\abs{x}` | ‖x‖, \|x\| (`\norm*{…}` grows with the contents) |
| `\inner{u}{v}` | ⟨u, v⟩ |
| `\set{1,2,3}` | {1, 2, 3} |
| `\setof{x \in S}{p(x)}` | {x ∈ S \| p(x)} |
| `A\tp` | transpose Aᵀ |
| `\map{f}{\R^n}{\R}` | f : ℝⁿ → ℝ |
| `\defeq` | := |
| `\argmin_{x \in C} f(x)`, `\argmax` | arg min with the subscript underneath |
| `\minimize{f(x)}{x \in \R^n \\ Ax \le b}` | min with the constraints stacked under it |
| `\maximize{c\tp x}{x \ge 0}` | same with max |
| `\ball{v}{\epsilon}` | open ball B(v, ε) |
| `\dist{u}{v}` | d(u, v) |
| `\interior{S}`, `\bd{S}` | interior S°, boundary ∂S |
| `\Rx`, `\Rx[t]` | polynomials ℝ[x], ℝ[t] |

Notes:

- `\partialdiff` collapses *consecutive* repeats into powers, so `{x,x,y}`
  gives ∂x²∂y, while `{x,y,x}` keeps the order you wrote. The total order
  goes on the ∂ in the numerator.
- `\hessian[function][variable][point]{dimension}` defaults to `f`, `x` and `v`.
  Pass an empty `[]` as the point to leave it out. Its
  entries are built with `\partialdiff` and the matrix with `\mat`.
- **Bracket style.** Every matrix command (`\hessian`, `\idmat`, `\gradient`,
  `\jacobian`, `\colvec`, `\rowvec`, `\genmat`, `\symmat`, `\diagmat`) uses
  round brackets by default. Put `\usematb` at the top of the document (after
  `\begin{document}` or in the preamble) for square brackets, or load the
  package as `\usepackage[square]{latex-pro}`. `\usematp` switches back, and
  inside a group `{\usematb ...}` the change stays local.
- `\hessian`, `\idmat`, `\gradient`, `\jacobian`, `\colvec`, `\rowvec`, `\genmat` and `\symmat` share one
  matrix builder, so a number writes every entry and anything else (`n`, `m`, …)
  gives the dotted general form.
- The package now loads `amssymb` and `mathtools` (for ℝ and the auto-sizing
  delimiters). If another package already defines `\R`, `\set`, `\norm` etc.,
  LaTeX will stop with an "already defined" error naming the clash.

## Theorems and references

The package defines numbered environments for **theorem, proposition, lemma,
corollary, definition, exercise, example** and **remark** (one shared counter,
so you get Theorem 1, Lemma 2, Proposition 3, …). The command with the same
name writes a bold reference:

```latex
\begin{proposition}\label{prop:main}
  ...
\end{proposition}

By \proposition{prop:main} and \exercise{ex:limits} ...   % bold "Proposition 1", "Exercise 4"
See \theorem{3.2} in the course notes.                     % a number is written as is
```

| Command | Result |
| --- | --- |
| `\proposition{label}` | **Proposition 3** (number taken from the label) |
| `\proposition{3}` | **Proposition 3** (plain number written as is) |
| `\theorem{…}` `\lemma{…}` `\corollary{…}` `\definition{…}` `\exercise{…}` `\example{…}` `\remark{…}` | the same for each kind |

Notes:

- An unknown label shows **Proposition ??** with the usual LaTeX warning;
  compile twice as for any `\ref`.
- With `hyperref` loaded, the whole bold text is a link.
- `\usepackage[bysection]{latex-pro}` numbers them per section: 2.1, 2.2, …
- Change the printed words with e.g. `\renewcommand\exercisename{Opgave}`.
- Since the package defines these environments, remove any
  `\newtheorem{proposition}{…}` (etc.) lines from your own preamble.

See `examples/example.tex` for all of the above. Compile it from the
`examples` folder with `TEXINPUTS=..: pdflatex example.tex`, or after
installing the package (option A).
