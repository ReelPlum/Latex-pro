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
| `\hessian[y]{2}` | Hessian in variables y₁, y₂ |
| `\hessian[x,y]{2}` | Hessian in the variables x and y (entries ∂²f(v)/∂x∂y, …) |
| `\hessian[y][g]{n}` | Hessian of g in y₁,…,yₙ |
| `\hessian[x][f][\mathbf{a}]{2}` | Hessian of f at the point **a** |
| `\hessian*{2}` | Hessian with no point, entries ∂²f/∂xᵢ∂xⱼ (the star leaves the point out) |
| `\hessian[][g]{5}` | an empty option keeps its default: variables x, function g |
| `\idmat{3}` | the 3×3 identity matrix, written out |
| `\idmat{n}` | the general n×n identity matrix with ⋯ ⋮ ⋱ |
| `\diff[f]{x}`, `\diff[f]{x,x}` | df/dx, d²f/dx² (same rules as `\partialdiff`, upright d) |
| `\gradient{3}` | gradient ∇f(v) as a row vector (∂f(v)/∂x₁ ⋯ ∂f(v)/∂x₃), as in the IMO26 notes |
| `\gradient*[y][g]{n}` | general gradient of g in y₁,…,yₙ, no point |
| `\gradient[x,y,z]{}` | gradient in the variables x, y, z |
| `\jacobian{2}{3}` | 2×3 derivative matrix f′(v), entries ∂fᵢ(v)/∂xⱼ |
| `\jacobian[x,y]{2}{}` | 2×2 derivative matrix in the variables x, y |
| `\jacobian*{m}{n}` | general m×n derivative matrix, no point |
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
- `\hessian[variables][function][point]{dimension}` defaults to `x`, `f` and `v`.
  Leave an option empty to keep its default, e.g. `\hessian[][g]{5}` or
  `\hessian[][][\mathbf a]{2}`, and use the starred form `\hessian*` to leave the
  point out. The same goes for `\gradient` and `\jacobian`, and empty options also
  fall back to the default in `\colvec`, `\rowvec`, `\genmat` and `\symmat`.
  The variables are either
  one symbol, `[y]` → y₁, y₂, …, or a list, `[x,y,z]` → exactly x, y, z (then the
  size comes from the list and `{}` is enough).
  The entries are built with `\partialdiff` and the matrix with `\mat`.
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
name writes the reference in small caps:

```latex
\begin{proposition}\label{prop:main}
  ...
\end{proposition}

By \proposition{prop:main} and \exercise{ex:limits} ...   % small caps "Proposition 1", "Exercise 4"
See \theorem{3.2} in the course notes.                     % a number is written as is
```

| Command | Result |
| --- | --- |
| `\proposition{label}` | <span style="font-variant:small-caps">Proposition 3</span> (number taken from the label) |
| `\proposition{3}` | <span style="font-variant:small-caps">Proposition 3</span> (plain number written as is) |
| `\theorem{…}` `\lemma{…}` `\corollary{…}` `\definition{…}` `\exercise{…}` `\example{…}` `\remark{…}` | the same for each kind |

Notes:

- An unknown label shows **Proposition ??** with the usual LaTeX warning;
  compile twice as for any `\ref`.
- With `hyperref` loaded, the whole reference is a link.
- Change the look with e.g. `\renewcommand\latexprorefstyle[1]{\textbf{#1}}` for bold.
- `\usepackage[bysection]{latex-pro}` numbers them per section: 2.1, 2.2, …
- Change the printed words with e.g. `\renewcommand\exercisename{Opgave}`.
- Since the package defines these environments, remove any
  `\newtheorem{proposition}{…}` (etc.) lines from your own preamble.

See `examples/example.tex` for all of the above. Compile it from the
`examples` folder with `TEXINPUTS=..: pdflatex example.tex`, or after
installing the package (option A).
