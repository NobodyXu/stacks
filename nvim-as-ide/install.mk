all: install_nvim-as-ide

install_nvim-as-ide: install_git
	sudo $(apt) install -y neovim
	$(append) 'export EDITOR=nvim' ~/.bashrc
	./nvim-as-ide/install_packs.sh
