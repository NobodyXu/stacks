#!/bin/sh

not_supported() {
    echo Your system version is not supported
    exit 1
}

. /etc/os-release

if [ "$ID" = "ubuntu" ]; then
    postfix="xUbuntu_${VERSION_ID}"
elif [ "$ID" = "raspbian" ]; then
    postfix="Raspbian_${VERSION_ID}"
elif [ "$ID" = "debian" ]; then
    [ "${VERSION_ID}" -ne 10 ] && not_supported
    postfix="Debian_10"
else
    not_supported
fi

url_base="download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/${postfix}/"
# Add to source
echo "deb http://${url_base} /" | sudo tee '/etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list'
# Add the key
curl "https://${url_base}Release.key" | sudo apt-key add -
