all: install_clang install_clang_tools

install_clang: install_gcc
	sudo $(apt) install -y $(shell ./clang/check_and_return_packs.sh)
	./clang/post_configure.sh

install_clang_tools: install_clang
	sudo $(apt) install -y clang-tools clang-tidy
