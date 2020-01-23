all: install_podman

# The following instructions is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md

add_key_for_podman:
	./podman/add_key.sh

configure_rootless_podman_env:
	sudo $(apt) install -y slirp4netns fuse-overlayfs
	./podman/change-kernel-settings.sh

install_podman: add_key_for_podman configure_rootless_podman_env
	sudo $(apt) install -y podman
	sudo mkdir -p /etc/containers
	echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf
