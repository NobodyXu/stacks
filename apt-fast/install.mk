install_apt-fast_mirror: install_gnupg
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B
	cp apt-fast/apt-fast.list /etc/apt/sources.list.d/

install_apt-fast: install_apt-fast_mirror
	$(apt) install -y apt-fast
