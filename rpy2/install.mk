all: install_rpy2

install_rpy2: install_python
	$(su_orig) pip3 install --user rpy2
