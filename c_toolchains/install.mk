all: install_c_toolchains

install_c_toolchains: install_clang
	sudo $(apt) install -y ctags build-essential bison
