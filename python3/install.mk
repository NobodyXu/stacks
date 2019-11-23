install_python:
	# Nodejs and npm are requirements for jupyterlab
	$(apt) install -y python3 python3-pip python3-setuptools curl nodejs npm
	pip3 install --user jupyterlab numpy pandas sklearn bokeh matlab modin[all]
