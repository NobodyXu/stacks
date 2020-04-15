all: install_crun

install_crun: install_git install_c_toolchains install_python3_basics
	sudo $(apt) install -y libsystemd-dev libcap-dev libseccomp-dev libyajl-dev go-md2man
	./crun/compile.sh
