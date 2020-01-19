all: install_c_toolchains

install_c_toolchains: install_clang install_gcc
	sudo $(apt) install -y make ctags build-essential bison autoconf automake libtool pkgconf
