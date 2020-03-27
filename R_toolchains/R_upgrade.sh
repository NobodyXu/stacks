#!/bin/bash

exec R --no-save --no-restore -e "
library('devtools');
update.packages(lib.loc = Sys.getenv('R_LIBS_USER'), ask = F, Ncpus = $(nproc))
devtools::update_packages()"
