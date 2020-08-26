all: install_cling

install_cling: install_c_toolchains install_git
	sudo $(apt) install -y python
	exec ./cling/build_cling.sh
