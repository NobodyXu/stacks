configure_wsl:
    $(apt) install -y xdg-utils
	cp wsl/chrome /usr/local/bin
	update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/chrome 10
