all: install_cling

make_local_src_dir:
	mkdir -p ~/.local/src

install_cling: make_local_src_dir install_c_toolchains install_git install_gnupg install_cmake
	sudo $(apt) install -y debhelper devscripts
	exec ./cling/run_cpt.sh
