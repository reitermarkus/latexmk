#!/usr/bin/env bash

set -euo pipefail

docker build -t ghcr.io/reitermarkus/latexmk:main "$(dirname "${0}")"
docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" reitermarkus/latexmk "${@}"
