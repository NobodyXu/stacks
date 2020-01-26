all: install_google-benchmark

install_google-benchmark: install_c_toolchains install_linux-tools
	./google-benchmark/compile.sh
	sudo cp ./google-benchmark/run_google-benchmarks.sh /usr/local/bin/
