#!/bin/bash

grep -q "$1" "$2" || echo "$1" >> "$2"
