#!/bin/sh

# remove all build intermediates & artifacts
for dir in */; do
  [ -d "$dir" ] || continue
  (
    NAME=`basename $dir`
    echo "👧🏼 $NAME"
    rm -rf "$dir/.build" || exit
  )
done
