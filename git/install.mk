all: install_git

install_git:
	sudo $(apt) install -y git ca-certificates git-lfs --no-install-recommends
	git config --global merge.ff false
	git config --global pull.ff only
	git config --global pull.rebase preserve
