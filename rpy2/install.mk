all: install_rpy2

install_rpy2: install_python
	pip3 install --user rpy2
