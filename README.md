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
| `\gradient{3}` | gradient of f at v as a column vector of ∂f(v)/∂xᵢ |
| `\gradient[g][y][]{n}` | general gradient of g in y₁,…,yₙ, no point |
| `\colvec{n}`, `\colvec[v]{3}` | column vector (x₁,…,xₙ) / (v₁,v₂,v₃) |
| `\rowvec[w]{4}` | row vector [w₁ w₂ w₃ w₄] |
| `\genmat{m}{n}`, `\genmat[b]{2}{3}` | general matrix with entries aᵢⱼ |
| `\symmat{n}`, `\symmat[s]{3}` | general symmetric matrix, aᵢⱼ above the diagonal and mirrored below |
| `\symmat{1 & 2 & 3 \\ 4 & 5 \\ 6}` | symmetric matrix from its upper triangle (row by row, diagonal included) |
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

Notes:

- `\partialdiff` collapses *consecutive* repeats into powers, so `{x,x,y}`
  gives ∂x²∂y, while `{x,y,x}` keeps the order you wrote. The total order
  goes on the ∂ in the numerator.
- `\hessian[function][variable][point]{dimension}` defaults to `f`, `x` and `v`.
  Pass an empty `[]` as the point to leave it out. Its
  entries are built with `\partialdiff` and the matrix with `\bmat`.
- `\hessian`, `\idmat`, `\gradient`, `\colvec`, `\rowvec`, `\genmat` and `\symmat` share one
  matrix builder, so a number writes every entry and anything else (`n`, `m`, …)
  gives the dotted general form.
- The package now loads `amssymb` and `mathtools` (for ℝ and the auto-sizing
  delimiters). If another package already defines `\R`, `\set`, `\norm` etc.,
  LaTeX will stop with an "already defined" error naming the clash.

See `examples/example.tex` for all of the above. Compile it from the
`examples` folder with `TEXINPUTS=..: pdflatex example.tex`, or after
installing the package (option A).
