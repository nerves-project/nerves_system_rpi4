# #!/bin/bash
# # Custom script to modify bluez5_utils configuration
# #
# # This script is called from the post-build script and uses 
# # sed to replace localstatedir in the target system.

# set -e

# # Set BluezUtils localstatedir to /data
# # This makes bluetooth data persistent when mounted on a separate partition
# if [ -f "$TARGET_DIR/usr/libexec/bluetooth/bluetoothd" ]; then
#   # First, check if we can modify the binary directly
#   if grep -q "localstatedir=/var" "$TARGET_DIR/usr/libexec/bluetooth/bluetoothd"; then
#     sed -i 's|localstatedir=/var|localstatedir=/data|g' "$TARGET_DIR/usr/libexec/bluetooth/bluetoothd"
#     echo "BluezUtils localstatedir set to /data for persistent storage"
#   else
#     # Create directory structure if it doesn't exist
#     mkdir -p "$TARGET_DIR/data/bluetooth"
#     # Create a symlink from /data/bluetooth to /var/bluetooth if needed
#     if [ ! -L "$TARGET_DIR/var/bluetooth" ] && [ ! -e "$TARGET_DIR/var/bluetooth" ]; then
#       ln -sf "/data/bluetooth" "$TARGET_DIR/var/bluetooth"
#       echo "Created symlink from /var/bluetooth to /data/bluetooth"
#     fi
#     echo "Set up directory structure for persistent BluezUtils storage"
#   fi
# else
#   echo "Warning: bluetoothd binary not found, skipping localstatedir modification"
# fi

# exit 0