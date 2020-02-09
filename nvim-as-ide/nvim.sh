#!/bin/bash

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    exec nvr "$@"
else
    exec /usr/bin/nvim "$@"
fi
