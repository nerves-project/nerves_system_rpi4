#!/bin/sh

set -e

# Create the revert script for manually switching back to the previously
# active firmware.
mkdir -p "$TARGET_DIR/usr/share/fwup"

if [ -f /root/local ]; then
  ln -sf /root/local "$TARGET_DIR/var/local"
fi

if [ -f /root/empty ]; then
  ln -sf /root/empty "$TARGET_DIR/var/empty"
fi

"$HOST_DIR/usr/bin/fwup" -c -f "$NERVES_DEFCONFIG_DIR/fwup-revert.conf" -o "$TARGET_DIR/usr/share/fwup/revert.fw"

# Copy the fwup includes to the images dir
cp -rf "$NERVES_DEFCONFIG_DIR/fwup_include" "$BINARIES_DIR"
