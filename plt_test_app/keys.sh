#!/bin/sh

mkdir -p rootfs_overlay/etc/ssh
yes | ssh-keygen -f rootfs_overlay/etc/ssh/ssh_host_rsa_key -N '' -t rsa
yes | ssh-keygen -f rootfs_overlay/etc/ssh/ssh_host_dsa_key -N '' -t dsa
yes | ssh-keygen -f rootfs_overlay/etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521
yes | ssh-keygen -f rootfs_overlay/etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 -a 100
