#!/usr/bin/env bash

set -e

DEFAULT_CONFIG_PREFIX="default"
CONFIG_SUFFIX=".conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARCH="$(uname)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

# "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
for conf in ${DEFAULT_CONFIG_PREFIX} ${ARCH}; do
  if [[ -f "${conf}${CONFIG_SUFFIX}" ]]; then
    "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${conf}${CONFIG_SUFFIX}"
  fi
done
