#!/system/bin/sh
CURRENT_DIR=$(cd $(dirname $0); pwd)
mkdir -p $CURRENT_DIR/cache
export PATH=$CURRENT_DIR/files/usr/bin:$PATH
export LD_LIBRARY_PATH=$CURRENT_DIR/files/usr/lib
export PROOT_TMP_DIR=/data/data/top.gfdgdxi.wine.runner.android/cache
export PROOT_LOADER=$CURRENT_DIR/files/usr/libexec/proot/loader
export PROOT_LOADER_32=$CURRENT_DIR/files/usr/libexec/proot/loader32  # 用于运行 armhf 应用
export LD_PRELOAD=$CURRENT_DIR/files/usr/lib/libtermux-exec.so
export HOME=$CURRENT_DIR/files/home/
export TMPDIR=$CURRENT_DIR/files/usr/tmp/
bash $CURRENT_DIR/files/usr/bin/neofetch
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

if [ $# -eq 0 ]; then
    bash $CURRENT_DIR/files/usr/bin/proot-distro login winerunner
else
    bash $CURRENT_DIR/files/usr/bin/proot-distro login winerunner -- $*
fi
exit $?