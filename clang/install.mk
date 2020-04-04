all: install_clang

install_clang: install_gcc
	sudo $(apt) install -y $(shell ./clang/check_and_return_packs.sh)
	./clang/post_configure.sh
