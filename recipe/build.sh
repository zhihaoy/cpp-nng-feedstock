#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

_cmake_config=(
    -DCMAKE_INSTALL_PREFIX="${PREFIX}"
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DCMAKE_OSX_SYSROOT="${CONDA_BUILD_SYSROOT}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_DISABLE_FIND_PACKAGE_Git=TRUE
    -DBUILD_SHARED_LIBS=ON
    -DNNG_TESTS=OFF
    -DNNG_ENABLE_NNGCAT=ON
    -DNNG_ENABLE_TLS=OFF
)

cmake -G Ninja "${_cmake_config[@]}" "${SRC_DIR}"

ninja install
