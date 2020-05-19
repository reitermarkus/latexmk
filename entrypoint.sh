#!/usr/bin/env bash

set -euo pipefail

function latexmk() {
  cd "$(dirname "${LATEXMKRC}")"
  command latexmk -cd "${@}"
}

if [[ -n "${LATEXMKRC:-}" ]]; then
  latexmk "${@}"
else
  find . -name .latexmkrc -print0 |
    while IFS= read -r -d $'\0' LATEXMKRC; do
      latexmk "${@}"
    done
fi
