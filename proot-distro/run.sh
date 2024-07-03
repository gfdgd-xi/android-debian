#!/system/bin/sh
CURRENT_DIR=$(cd $(dirname $0); pwd)
export PATH=$CURRENT_DIR/files/usr/bin:$PATH
export LD_LIBRARY_PATH=$CURRENT_DIR/files/usr/lib
export PROOT_TMP_DIR=$CURRENT_DIR/cache
export PROOT_LOADER=$CURRENT_DIR/files/usr/libexec/proot/loader
export PROOT_LOADER_32=$CURRENT_DIR/files/usr/libexec/proot/loader32  # 用于运行 armhf 应用
export LD_PRELOAD=$CURRENT_DIR/files/usr/lib/libtermux-exec.so
bash $CURRENT_DIR/files/usr/bin/neofetch
if [ $# -eq 0 ]; then
    bash $CURRENT_DIR/files/usr/bin/proot-distro login debian
else
    bash $CURRENT_DIR/files/usr/bin/proot-distro login debian -- $*
fi
exit $?