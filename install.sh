#!/bin/bash

[ -z "$ORIG_USER" ] && ORIG_USER=$USER

exec sudo env ORIG_USER=$ORIG_USER make -j `nproc` $1
