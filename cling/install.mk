all: install_cling

make_local_src_dir:
	mkdir -p ~/.local/src

install_cling: make_local_src_dir install_python install_c_toolchains install_git install_apt-add-repository
	sudo $(apt) install -y debhelper devscripts wget
	exec ./cling/run_cpt.sh
