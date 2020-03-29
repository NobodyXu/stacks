all: install_cling

install_cling: install_python install_c_toolchains install_git
	exec ./cling/build_cling.sh
