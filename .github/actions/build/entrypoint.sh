#!/bin/bash

git config --global --add safe.directory "/github/workspace"

make "$DOCKER_TARGET"
