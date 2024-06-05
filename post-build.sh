#!/usr/bin/env bash

set -e

# replace DRI libs with symlinks to save space
function slim_down_dri_libs() {
    pushd $STAGING_DIR/usr/lib/dri/

    for f in *.so; do
        if [[ "$f" != "v3d_dri.so" ]]; then
            rm "$f"
            ln -s v3d_dri.so "$f"
        fi
    done

    popd
}


slim_down_dri_libs

# Create the fwup ops script to handling MicroSD/eMMC operations at runtime
# NOTE: revert.fw is the previous, more limited version of this. ops.fw is
#       backwards compatible.
mkdir -p $TARGET_DIR/usr/share/fwup
$HOST_DIR/usr/bin/fwup -c -f $NERVES_DEFCONFIG_DIR/fwup-ops.conf -o $TARGET_DIR/usr/share/fwup/ops.fw
ln -sf ops.fw $TARGET_DIR/usr/share/fwup/revert.fw

# Copy the fwup includes to the images dir
cp -rf $NERVES_DEFCONFIG_DIR/fwup_include $BINARIES_DIR
