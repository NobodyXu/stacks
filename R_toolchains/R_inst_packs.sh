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
list.of.packages <- c(${packs})
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]

if (length(new.packages))
    install.packages(new.packages, lib = local_lib, Ncpus = `nproc`)
") | R --no-save --no-restore
