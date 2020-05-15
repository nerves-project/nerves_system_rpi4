#!/bin/bash

mkdir -p /github/home/.nerves/dl
cp -r vendor/* /github/home/.nerves/dl/
make dist

