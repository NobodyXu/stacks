#!/bin/sh

# Download cpt manager
cd ~/.local/bin
if [ ! -f cpt.py ]; then
    wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
    chmod +x ./cpt.py
fi

# Goto work dir
cd ~/.local/src

# Check environment
cpt.py -c

# Start cpt manager to download source code and compile
exec cpt.py --last-stable deb --create-dev-env Release -y --with-workdir=./cling-build/
