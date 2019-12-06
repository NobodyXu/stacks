wsl: configure_wsl

configure_wsl:
	sudo $(apt) install -y xdg-utils
	sudo cp wsl/chrome /usr/local/bin
	sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/chrome 10
