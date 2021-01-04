#!/bin/sh

#
# Upload new firmware to a device running ssh_subsystem_fwup
#
# Usage:
#   upload.sh [destination IP] [Path to .fw file]
#
# If unspecified, the destination is nerves.local and the .fw file is naively
# guessed
#
# You may want to add the following to your `~/.ssh/config` to avoid recording
# the IP addresses of the target:
#
# Host nerves.local
#   UserKnownHostsFile /dev/null
#   StrictHostKeyChecking no
#
# The firmware update protocol is:
#
# 1. Connect to the ssh_subsystem_fwup service running on port 22
# 2. Send the firmware file
# 3. The response from the device is a progress bar from fwup that can either
#    be ignored or shown to the user.
# 4. The ssh connection is closed with an exit code to indicate success or
#    failure
#
# Feel free to copy this script wherever is convenient. The template is at
# https://github.com/nerves-project/ssh_subsystem_fwup/blob/main/priv/templates/script.upload.eex
#

set -e

DESTINATION=$1
FILENAME="$2"

help() {
  echo
  echo "upload.sh [destination IP] [Path to .fw file]"
  echo
  echo "Default destination IP is 'nerves.local'"
  echo "Default firmware bundle is the first .fw file in '_build/\${MIX_TARGET}_\${MIX_ENV}/nerves/images'"
  echo
  echo "MIX_TARGET=$MIX_TARGET"
  echo "MIX_ENV=$MIX_ENV"
  exit 1
}

[ -n "$DESTINATION" ] || DESTINATION=nerves.local
if [ -z "$FILENAME" ]; then
  [ -n "$MIX_TARGET" ] || MIX_TARGET=rpi0
  [ -n "$MIX_ENV" ] || MIX_ENV=dev
  FIRMWARE_PATH="./_build/${MIX_TARGET}_${MIX_ENV}/nerves/images"
  if [ ! -d "$FIRMWARE_PATH" ]; then
      echo "Can't find the build products."
      echo
      echo "Nerves environment"
      echo "MIX_TARGET:    ${MIX_TARGET}"
      echo "MIX_ENV:       ${MIX_ENV}"
      echo
      echo "Make sure your Nerves environment is correct."
      echo
      echo "If the Nerves environment is correct make sure you have built the firmware"
      echo "using 'mix firmware'."
      echo
      echo "If you are uploading a .fw file from a custom path you can specify the"
      echo "path like so:"
      echo
      echo "  $0 <device hostname or IP address> </path/to/my/firmware.fw>"
      echo
      exit 1
  fi

  FILENAME=$(ls "$FIRMWARE_PATH/"*.fw 2> /dev/null | head -n 1)
  [ -n "$FILENAME" ] || (echo "Error: error determining firmware bundle."; help)
fi

[ -f "$FILENAME" ] || (echo "Error: can't find '$FILENAME'"; help)

FIRMWARE_METADATA=$(fwup -m -i "$FILENAME" || echo "meta-product=Error reading metadata!")
FIRMWARE_PRODUCT=$(echo "$FIRMWARE_METADATA" | grep -E "^meta-product=" -m 1 2>/dev/null | cut -d '=' -f 2- | tr -d '"')
FIRMWARE_VERSION=$(echo "$FIRMWARE_METADATA" | grep -E "^meta-version=" -m 1 2>/dev/null | cut -d '=' -f 2- | tr -d '"')
FIRMWARE_PLATFORM=$(echo "$FIRMWARE_METADATA" | grep -E "^meta-platform=" -m 1 2>/dev/null | cut -d '=' -f 2- | tr -d '"')
FIRMWARE_UUID=$(echo "$FIRMWARE_METADATA" | grep -E "^meta-uuid=" -m 1 2>/dev/null | cut -d '=' -f 2- | tr -d '"')

echo "Path: $FILENAME"
echo "Product: $FIRMWARE_PRODUCT $FIRMWARE_VERSION"
echo "UUID: $FIRMWARE_UUID"
echo "Platform: $FIRMWARE_PLATFORM"
echo
echo "Uploading to $DESTINATION..."

cat "$FILENAME" | ssh -s $SSH_OPTIONS $DESTINATION fwup
