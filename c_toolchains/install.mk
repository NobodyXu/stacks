all: install_c_toolchains

install_c_toolchains: install_clang
	$(apt) install -y ctags build-essential bison
