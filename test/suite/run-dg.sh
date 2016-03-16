#!/bin/bash
for t in gcc-dg-* ; do
    echo "-----------------------"
    echo "Running gcc dg suite $t"
    echo "-----------------------"
    ./run-suite.sh $t `find gcc.dg -name '*.h' | xargs dirname | sort | uniq | sed 's/^/-I..\//'`
done
