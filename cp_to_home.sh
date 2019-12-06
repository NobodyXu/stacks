#!/bin/bash

src=${1}
dst=${ORIG_HOME}/${2}

cp $src $dst
exec chown ${ORIG_USER}:${ORIG_USER} $dst
