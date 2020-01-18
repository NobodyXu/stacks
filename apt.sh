#!/bin/bash

has_command() {
    which $1 >/dev/null
}

if has_command apt-fast; then
    source apt-fast update
    source apt-fast $@
elif has_command apt; then
    apt update
    apt $@
else
    apt-get update
    apt-get $@
fi
