#!/bin/sh

# Download cpt manager
mkdir -p ~/.local/bin
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
exec cpt.py --create-dev-env Release --last-stable deb --with-workdir=./cling-build/ -y 
