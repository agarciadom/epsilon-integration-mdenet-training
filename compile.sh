#!/bin/bash

set -e

PANDOC_VERSION=2.14

pandoc_docker() {
  docker run --rm \
    --volume "`pwd`:/data" \
    --user `id -u`:`id -g` \
    "pandoc/core:$PANDOC_VERSION" "$@"
}

compile() {
  $PANDOC -t revealjs -s slides.md \
    -f markdown-markdown_in_html_blocks-native_divs \
    --template=custom.revealjs \
    -V theme=night \
    -V revealjs-url=./reveal.js \
    --css slides.css \
    --highlight-style zenburn \
    --syntax-definition eol.xml \
    --syntax-definition etl.xml \
    -o index.html
}

usage() {
  echo "Usage: $0 [-o: run once] [-s: use system pandoc command]" 1>&2
  exit 1
}

LOOP=1
PANDOC=pandoc_docker
while getopts ":os" opt; do
  case "${opt}" in
    o)
      LOOP=0
      ;;
    s)
      echo "Using 'pandoc' system command"
      PANDOC=pandoc
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

if test "$LOOP" -eq 0; then
  compile
else
  while compile; do
    inotifywait -e close_write slides.md slides.css *.xml
  done
fi
