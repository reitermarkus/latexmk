#!/usr/bin/env bash

set -euo pipefail

docker build -t reitermarkus/latexmk "$(dirname "${0}")"
docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" reitermarkus/latexmk "${@}"
