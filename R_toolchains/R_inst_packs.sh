#!/bin/bash

if [ -z "$1" ]; then
    exit
fi

packs="'$1'"
for pack in ${@:2}; do
    packs+=", '$pack'"
done

#echo $packs
exec ./R_inst_packs.R
