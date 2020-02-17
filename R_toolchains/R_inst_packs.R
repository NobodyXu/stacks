#!/usr/bin/Rscript

args = commandArgs(trailingOnly=TRUE)

# create local user library path (not present by default)
local_lib = Sys.getenv('R_LIBS_USER')
dir.create(path = local_lib, showWarnings = T, recursive = T)
# install to local user library path
list.of.packages <- args
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]

if (length(new.packages)) {
    print("The following packages are going to be installed:")
    print(new.packages)
    install.packages(new.packages, lib = local_lib, Ncpus = getOption("Ncpus"))
}
