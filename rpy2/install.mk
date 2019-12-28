all: install_rpy2

install_rpy2: install_python3
	pip3 install --user rpy2
