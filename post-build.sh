#!/bin/bash

set -e

# replace DRI libs with symlinks to save space
slim_down_dri_libs() {
    pushd $STAGING_DIR/usr/lib/dri/

    for f in *.so; do
        if [ "$f" = "v3d_dri.so" ]; then
            continue
        fi

        rm "$f"
        ln -s v3d_dri.so "$f"
    done

    popd
}


slim_down_dri_libs

# Create the revert script for manually switching back to the previously
# active firmware.
mkdir -p $TARGET_DIR/usr/share/fwup
$HOST_DIR/usr/bin/fwup -c -f $NERVES_DEFCONFIG_DIR/fwup-revert.conf -o $TARGET_DIR/usr/share/fwup/revert.fw

# Copy the fwup includes to the images dir
cp -rf $NERVES_DEFCONFIG_DIR/fwup_include $BINARIES_DIR
