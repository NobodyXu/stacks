all: install_clang

install_clang:
	$(apt) install -y clang-8 lld-8
