#!/bin/bash

set -e

BR2_TARGET_DIR="${1}"

rm -rf "$BR2_TARGET_DIR/mnt/plt"

mkdir "$BR2_TARGET_DIR/mnt/plt"


