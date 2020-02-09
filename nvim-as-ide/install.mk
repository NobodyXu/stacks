all: install_nvim-as-ide

install_nvim-as-ide: install_git install_python3_basics
	sudo $(apt) install -y neovim
	# Install neovim-remote
	pip3 install neovim-remote
	# Install nvim wrapper to /usr/local/bin
	sudo cp ./nvim-as-ide/nvim.sh /usr/local/bin/nvim
	$(append) 'export EDITOR=nvim' ~/.bashrc
	./nvim-as-ide/install_packs.sh
