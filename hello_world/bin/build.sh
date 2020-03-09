#!/usr/bin/env bash

BASE_DIR=$(dirname $0)

# Rendering config
${BASE_DIR}/render-config.sh

yarn install

yarn build