curl pyenv.run | bash

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

export CFLAGS='-O3'

# pyenv
export PATH="$PATH:/home/nobodyxu/.pyenv/bin"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"


pyenv install pypy-stm-2.5.1
