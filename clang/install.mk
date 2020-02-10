all: install_clang

install_clang: install_gcc
	sudo $(apt) install -y clang lld llvm
	./clang/post_configure.sh
