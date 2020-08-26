#!/bin/bash

export SDKMAN_DIR="/home/nobodyxu/.sdkman"
source "${SDKMAN_DIR}/bin/sdkman-init.sh"
sdk install gradle

# Install gradle completion
mkdir -p ${HOME}/bash_completion.d
curl -LA gradle-completion https://edub.me/gradle-completion-bash -o ${HOME}/bash_completion.d/gradle-completion.bash
./append.sh 'source ${HOME}/bash_completion.d/gradle-completion.bash' ~/.bashrc
