all: install_fuse-overlayfs

install_fuse-overlayfs: install_git install_c_toolchains
	sudo $(apt) install -y libc6-dev pkgconf libfuse3-dev
	./fuse-overlayfs/compile.sh
