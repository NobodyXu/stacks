all: install_python

install_python:
	# Nodejs and npm are requirements for jupyterlab
	sudo $(apt) install -y python python-pip python-setuptools
