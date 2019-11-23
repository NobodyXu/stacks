all: install_git

install_git:
	$(apt) install -y git ca-certificates git-lfs
