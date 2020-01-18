all: install_cling

make_local_src_dir:
	mkdir -p ~/.local/src

install_cling: make_local_src_dir install_c_toolchains install_git install_gnupg install_cmake
	sudo $(apt) install -y debhelper devscripts
	# Goto work dir
	cd ~/.local/src
	# Download cpt manager
	wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
	chmod +x ./cpt.py
	# Check environment
	./cpt.py -c
	# Start cpt manager to download source code and compile
	./cpt.py --last-stable deb --create-dev-env Release -y --with-workdir=./cling-build/
