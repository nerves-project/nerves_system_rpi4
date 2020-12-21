#!/bin/bash

set -e

if [ -d /root/local ]; then
  ln -sf /root/local "$TARGET_DIR/var/local"
fi

if [ -d /root/empty ]; then
  ln -sf /root/empty "$TARGET_DIR/var/empty"
fi


