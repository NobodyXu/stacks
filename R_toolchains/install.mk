all: install_R_toolchains

install_R_mirror: install_gnupg
	./R_toolchains/add_repo.sh

install_R_toolchains: install_R_mirror
	$(apt) install -y r-base-dev r-recommended libatlas3-base curl libcurl4-openssl-dev libxml2-dev
	$(cp_to_home) ./R_toolchains/Rprofile .Rprofile
	$(su_orig) ./R_toolchains/R_inst_packs.sh tidyverse data.table stringr stringi devtools
