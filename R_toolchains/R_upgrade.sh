#!/bin/bash

exec R --no-save --no-restore -e "update.packages(ask = F, Ncpus = $(nproc))"
