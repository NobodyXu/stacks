all: install_python3

install_python3_basics: install_curl
	sudo $(apt) install -y python3 python3-pip python3-setuptools

install_python3: install_python3_basics install_c_toolchains
	sudo $(apt) install -y nodejs npm
	# Use $$ to express $ (escape)
	$(append) 'export PATH=$${HOME}/.local/bin:$${PATH}' ~/.bashrc
	pip3 install --user jupyterlab numpy pandas sklearn bokeh matlab modin[all]
	sudo cp ./python3/pip3_upgrade /usr/local/bin/
