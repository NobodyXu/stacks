#!/bin/bash -ex

if [ -n "$1" ]; then
    mybench=$1
else
    mybench=./a.out
    if [ ! -f $mybench ] || [ ! -x $mybench ]; then
        echo $0 [optional: executable linked with libbenchmark or libbenchmark_main]
        echo If the optional arg is not provided, it is default to ./a.out.
        exit 1
    fi
fi

sudo cpupower frequency-set --governor performance
$mybench
exec sudo cpupower frequency-set --governor powersave
