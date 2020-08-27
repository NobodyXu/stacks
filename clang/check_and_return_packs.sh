#!/bin/bash

packs="clang llvm clangd "
if [ -n "$(apt list lld | tail -n +2)" ]; then
    packs+=lld
else
    packs+="$(apt list lld-* | tail -n +2 | cut -d '/' -f 1 | sort -V | tail -n 1)"
fi

echo $packs
