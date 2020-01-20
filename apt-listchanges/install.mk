all: install_apt-listchanges

install_apt-listchanges:
	# The following instructions are adapted from:
	#     https://askubuntu.com/a/272433/772092
	sudo $(apt) install -y apt-listchanges
	sudo dpkg-reconfigure apt-listchanges
