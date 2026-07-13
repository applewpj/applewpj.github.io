#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
export RUBYOPT="-r${ROOT_DIR}/scripts/pathutil-ruby3-compat.rb${RUBYOPT:+ ${RUBYOPT}}"

cd "$ROOT_DIR"
bundle exec jekyll serve --livereload --host 0.0.0.0 --port 4000
