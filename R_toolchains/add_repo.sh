#!/bin/bash

source /etc/os-release

distro=$ID
codename=`lsb_release -cs`

[ $distro = "ubuntu" ] && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 'E298A3A825C0D65DFD57CBB651716619E084DAB9'
[ $distro = "debian" ] && apt-key adv --keyserver keys.gnupg.net       --recv-keys 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'

echo "deb https://cloud.r-project.org/bin/linux/$distro ${codename}-cran35/" >/etc/apt/sources.list.d/R_official_repo.list
