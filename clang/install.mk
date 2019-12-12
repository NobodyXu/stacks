all: install_clang

install_clang:
	sudo $(apt) install -y clang lld
