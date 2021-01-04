#!/bin/bash

mkdir -p /github/home/.nerves/dl
cp -r vendor/* /github/home/.nerves/dl/
make dist
cp /github/home/.nerves/dl/ly11_system_rpi4* dist/
make dist-test-app


