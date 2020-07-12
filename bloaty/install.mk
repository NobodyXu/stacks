all: install_bloaty

install_bloaty: install_git install_c_toolchains
	sudo $(apt) install -y protobuf-compiler
	./bloaty/compile.sh
