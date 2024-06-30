#!/bin/sh
export PATH=$(pwd)/files/usr/bin:$PATH
export LD_LIBRARY_PATH=$(pwd)/files/usr/lib
export PROOT_TMP_DIR=$(pwd)/cache
export PROOT_LOADER=$(pwd)/files/usr/libexec/proot/loader
bash $(pwd)/files/usr/bin/neofetch
bash $(pwd)/files/usr/bin/proot-distro login debian
