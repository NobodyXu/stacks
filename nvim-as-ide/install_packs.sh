#!/bin/bash

source compile_helpers.sh

mkdir -p ~/Dev
cd ~/Dev

clone_or_update nvim-as-ide https://github.com/NobodyXu/nvim-as-ide

cd nvim-as-ide/
./check_nvim_env.sh
./install.sh
