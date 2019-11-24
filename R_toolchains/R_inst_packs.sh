#!/bin/bash

if [ -z "$1" ]; then
    exit
fi

packs="'$1'"
for pack in ${@:2}; do
    packs+=", '$pack'"
done

#echo $packs

(echo "
# create local user library path (not present by default)
local_lib = Sys.getenv('R_LIBS_USER')
dir.create(path = local_lib, showWarnings = T, recursive = T)
# install to local user library path
install.packages(c(${packs}), lib = local_lib, Ncpus = `nproc`)
") | R --no-save --no-restore
