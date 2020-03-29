all: install_wireshark

install_wireshark:
	sudo $(apt) install -y wireshark tshark #wireshark-dev
