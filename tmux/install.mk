all: install_tmux

install_tmux:
	$(apt) install -y tmux
	$(su_orig) ./tmux/config.sh
