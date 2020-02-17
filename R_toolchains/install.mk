all: install_R_toolchains

install_R_mirror: install_apt-add-repository
	sudo ./R_toolchains/add_repo.sh

install_R_toolchains: install_R_mirror install_curl
	sudo $(apt) install -y r-base-dev texlive-full build-essential r-base-core r-recommended libatlas3-base libcurl4-openssl-dev libxml2-dev
	#$(cp_to_home) ./R_toolchains/Rprofile .Rprofile
	cp ./R_toolchains/Rprofile ~/.Rprofile
	sudo cp ./R_toolchains/R_upgrade.sh /usr/local/bin/
	./R_toolchains/R_inst_packs.R tidyverse data.table stringr stringi devtools
