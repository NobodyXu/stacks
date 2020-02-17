#!/usr/bin/Rscript

args = commandArgs(trailingOnly=TRUE)

# create local user library path (not present by default)
local_lib = Sys.getenv('R_LIBS_USER')
dir.create(path = local_lib, showWarnings = T, recursive = T)

# install to local user library path
wanted_packages <- args
installed_packages <- installed.packages()[,'Package']

packs <- wanted_packages[!(wanted_packages %in% installed_packages)]

if (length(packs) > 0) {
    print("The following packages are going to be installed:")
    print(packs)
    install.packages(packs, lib = local_lib, Ncpus = getOption("Ncpus"))
}
