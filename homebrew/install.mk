all: install_homebrew

install_homebrew: install_c_toolchains install_curl install_git
	sudo $(apt) install -y file
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
