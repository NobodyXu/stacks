#!/bin/sh

echo "$1" | sudo tee /etc/apt/sources.list.d/"$2"
