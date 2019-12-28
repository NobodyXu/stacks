#!/bin/bash

mkdir -p ${HOME}/bash_completion.d
curl -LA gradle-completion https://edub.me/gradle-completion-bash -o ${HOME}/bash_completion.d/gradle-completion.bash
./append.sh 'source ${HOME}/bash_completion.d/gradle-completion.bash' ~/.bashrc
