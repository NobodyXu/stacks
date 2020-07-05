all: install_podman

# The following instructions is adapted from:
#     https://github.com/containers/libpod/blob/master/install.md

add_key_for_podman: install_apt-add-repository
	./podman/add_key.sh

configure_rootless_podman_env:
	sudo $(apt) install -y slirp4netns
	./podman/change-kernel-settings.sh

install_podman: add_key_for_podman configure_rootless_podman_env install_crun
	sudo $(apt) install -y podman fuse-overlayfs
	sudo mkdir -p /etc/containers
	echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf
	# Configure podman
	sudo cp ./podman/libpod.conf /etc/containers/libpod.conf
	mkdir -p ~/.config/containers
	cp ./podman/libpod.conf ~/.config/containers
	# Configure path to fuse-overlayfs
	cp ./podman/storage.conf ~/.config/containers
