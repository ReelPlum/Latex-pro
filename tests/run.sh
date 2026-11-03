#!/usr/bin/env bash
# Compile every test (tests/test-*.tex) and every example (examples/*.tex)
# against the .sty files in this repository, and fail if anything breaks.
#
#   tests/run.sh            everything
#   tests/run.sh matrix     only files whose name contains "matrix"
#
# A file fails when it does not compile, when an lptest check fails
# (LPTEST FAIL in the log), or when the final log still has an undefined
# reference or control sequence. PDFs and logs go to build/.
set -u
root="$(cd "$(dirname "$0")/.." && pwd)"
build="$root/build"
filter="${1:-}"
mkdir -p "$build"

# This repository's .sty files come first, so an installed copy of
# latex-pro elsewhere is never used by mistake.
export TEXINPUTS="$root//:"

pass=0
fail=0
failed=()
for tex in "$root"/tests/test-*.tex "$root"/examples/*.tex; do
  name="$(basename "$(dirname "$tex")")-$(basename "$tex" .tex)"
  [[ -n "$filter" && "$name" != *"$filter"* ]] && continue
  out="$build/$name"
  mkdir -p "$out"
  if latexmk -pdf -interaction=nonstopmode -halt-on-error -silent \
       -outdir="$out" -jobname="$name" "$tex" >"$out/latexmk.out" 2>&1; then
    log="$out/$name.log"
    problems="$(grep -E 'LPTEST FAIL|LaTeX Warning: (Reference|There were undefined)|Undefined control sequence|Package latex-pro Warning' "$log")"
  else
    log="$out/$name.log"
    problems="$(grep -E -A3 '^!|LPTEST FAIL' "$log" 2>/dev/null | head -20)"
    [[ -z "$problems" ]] && problems="latexmk failed, see $out/latexmk.out"
  fi
  checks="$(grep -o 'LPTEST SUMMARY: .*' "$log" 2>/dev/null | tail -1)"
  if [[ -z "$problems" ]]; then
    pass=$((pass + 1))
    echo "ok    $name ${checks:+($checks)}"
  else
    fail=$((fail + 1))
    failed+=("$name")
    echo "FAIL  $name ${checks:+($checks)}"
    echo "$problems" | sed 's/^/      /'
  fi
done

echo
echo "$pass file(s) passed, $fail failed"
if ((fail > 0)); then
  printf '  %s\n' "${failed[@]}"
  exit 1
fi
