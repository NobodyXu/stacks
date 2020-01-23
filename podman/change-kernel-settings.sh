#!/bin/bash

# Loads system info
. /etc/os-release

# Allow ping for unprivileged users
sudo cp ./podman/10-rootless-ping-for-container.conf /etc/sysctl.d/

# Allow userns for unprivileged users
if [ "${ID}" = "debian" ]; then
    sudo cp ./podman/10-userns-for-unprivileged-in-debian.conf /etc/sysctl.d/
fi

# Apply these settings
sudo sysctl --system

# Allow overlay for unprivileged
if [ "${ID}" = "debian" ] || [ "${NAME}" = "Pop!_OS" ]; then
	sudo modprobe overlay 'permit_mounts_in_userns=1'
	sudo cp ./podman/unprivileged-overlayfs.conf /etc/modprobe.d/
fi
