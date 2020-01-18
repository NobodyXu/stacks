#!/bin/sh

# Goto work dir
cd ~/.local/src

# Download cpt manager
wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
chmod +x ./cpt.py

# Check environment
./cpt.py -c

# Start cpt manager to download source code and compile
./cpt.py --last-stable deb --create-dev-env Release -y --with-workdir=./cling-build/
