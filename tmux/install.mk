all: install_tmux

install_tmux:
	sudo $(apt) install -y tmux
	./tmux/config.sh
