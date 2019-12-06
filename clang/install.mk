all: install_clang

install_clang:
	sudo $(apt) install -y clang-8 lld-8
