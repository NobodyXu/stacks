all: install_postgresql

codename=$(shell lsb_release -cs)

install_postgresql_mirror: install_apt-add-repository
	curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	echo deb http://apt.postgresql.org/pub/repos/apt $(codename)-pgdg main | sudo tee /etc/apt/sources.list.d/pgdg.list

install_postgresql: install_apt-fast_mirror
	sudo $(apt) install -y postgresql pgadmin4
