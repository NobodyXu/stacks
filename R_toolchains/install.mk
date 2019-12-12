all: install_R_toolchains

install_R_mirror: install_gnupg
	sudo ./R_toolchains/add_repo.sh

install_R_toolchains: install_R_mirror install_curl
	sudo $(apt) install -y r-base-dev texlive-full build-essential r-base-core r-recommended libatlas3-base libcurl4-openssl-dev libxml2-dev
	#$(cp_to_home) ./R_toolchains/Rprofile .Rprofile
	cp ./R_toolchains/Rprofile ~/.Rprofile
	./R_toolchains/R_inst_packs.sh tidyverse data.table stringr stringi devtools
