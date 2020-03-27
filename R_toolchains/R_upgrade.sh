#!/bin/bash

exec R --no-save --no-restore -e "
library('devtools');
update.packages(ask = F, Ncpus = $(nproc))
devtools::update_packages()"
