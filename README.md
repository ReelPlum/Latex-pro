# Latex-pro

A personal LaTeX library of maths shortcut commands, packaged as
`mathshortcuts.sty`.

## Install

**Option A, install once for every project (recommended).** Copy (or symlink)
`mathshortcuts.sty` into your personal texmf tree, then use
`\usepackage{mathshortcuts}` anywhere.

| System | Folder |
| --- | --- |
| Windows (MiKTeX) | any folder you add under *MiKTeX Console → Settings → Directories*, inside `tex/latex/mathshortcuts/`, then *Tasks → Refresh file name database* |
| Windows / Linux (TeX Live) | `~/texmf/tex/latex/mathshortcuts/` (find it with `kpsewhich -var-value TEXMFHOME`) |
| macOS (MacTeX) | `~/Library/texmf/tex/latex/mathshortcuts/` |

A symlink means `git pull` in this repo updates every project at once.

**Option B, per project.** Put `mathshortcuts.sty` next to your `.tex` file.

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
| `\hessian{3}` | the 3×3 Hessian of f, every entry written out |
| `\hessian{n}` | the general n×n Hessian with ⋯ ⋮ ⋱ |
| `\hessian[g][y]{2}` | Hessian of g in variables y₁, y₂ |

Notes:

- `\partialdiff` collapses *consecutive* repeats into powers, so `{x,x,y}`
  gives ∂x²∂y, while `{x,y,x}` keeps the order you wrote. The total order
  goes on the ∂ in the numerator.
- `\hessian[function][variable]{dimension}` defaults to `f` and `x`. Its
  entries are built with `\partialdiff` and the matrix with `\bmat`.

See `examples/example.tex` for all of the above. Compile it from the
`examples` folder with `TEXINPUTS=..: pdflatex example.tex`, or after
installing the package (option A).
