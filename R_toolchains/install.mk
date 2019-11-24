all: install_R_toolchains

install_R_mirror: install_gnupg
	apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
	echo 'deb http://cloud.r-project.org/bin/linux debian buster-cran35' >/etc/apt/sources.list.d/R_backport.list


install_R_toolchains: install_R_mirror
	$(apt) install -y r-base-dev r-recommended libatlas3-base curl
	$(su_orig) ./R_toolchains/R_inst_packs.sh tidyverse data.table stringr stringi devtools
