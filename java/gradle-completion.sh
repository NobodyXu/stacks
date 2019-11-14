mkdir $HOME/bash_completion.d
curl -LA gradle-completion https://edub.me/gradle-completion-bash -o $HOME/bash_completion.d/gradle-completion.bash

echo 'source $HOME/bash_completion.d/gradle-completion.bash' >> ~/.bashrc
