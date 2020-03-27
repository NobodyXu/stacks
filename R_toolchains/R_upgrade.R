#!/usr/bin/Rscript

library('devtools')

update.packages(lib.loc = Sys.getenv('R_LIBS_USER'), ask = F, Ncpus = getOption('Ncpus'))
devtools::update_packages(upgrade = 'always')
