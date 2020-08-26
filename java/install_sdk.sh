#!/bin/bash

sdk --version >/dev/null 2>&1
if [ $? -eq 127 ]; then
    curl -s "https://get.sdkman.io" | bash
fi
