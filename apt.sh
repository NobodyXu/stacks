#!/bin/bash

has_command() {
    which $1 >/dev/null
}

if has_command apt-fast; then
    apt-fast update
    apt-fast $@
elif has_command apt; then
    apt update
    apt $@
else
    apt-get update
    apt-get $@
fi
