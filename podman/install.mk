all: install_podman

install_podman:
	# The following instructions is adapted from:
	#     https://github.com/containers/libpod/blob/master/install.md
	./podman/add_key.sh
	sudo $(apt) install -y podman
	sudo mkdir -p /etc/containers
	echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf
