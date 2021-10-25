#!/bin/bash

set -e

mkdir -p /github/workspace/.nerves

mkdir -p /github/workspace/nerves-buildroot-cache

NERVES_BR_DL_DIR=/github/workspace/nerves-buildroot-cache make dist

set +e

cp /github/workspace/nerves-buildroot-cache/ly11_system_rpi4* dist/

set -e

make dist-test-app

