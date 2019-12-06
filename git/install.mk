all: install_git

install_git:
	sudo $(apt) install -y git ca-certificates git-lfs
