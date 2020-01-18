#!/bin/bash

has_command() {
    which $1 >/dev/null
}

if has_command apt-fast; then
    apt-fast update
    exec apt-fast $@
elif has_command apt; then
    apt update
    exec apt $@
else
    apt-get update
    exec apt-get $@
fi
