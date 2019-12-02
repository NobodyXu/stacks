all: install_nvim-as-ide

install_nvim-as-ide: install_git
	$(apt) install -y neovim
	$(append) 'export EDITOR=nvim' ~/.bashrc
	$(su_orig) ./nvim-as-ide/install_packs.sh
