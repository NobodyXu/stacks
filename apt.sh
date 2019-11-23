#!/bin/bash

has_command() {
    which $1 >/dev/null
}

if has_command apt-fast; then
    apt-fast $@
elif has_command apt; then
    apt $@
else
    apt-get $@
fi
