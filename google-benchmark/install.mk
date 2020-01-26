all: install_google-benchmark

install_google-benchmark: install_c_toolchains
	./google-benchmark/compile.sh
