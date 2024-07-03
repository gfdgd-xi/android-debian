#!/system/bin/sh
CURRENT_DIR=$(cd $(dirname $0); pwd)
export PATH=$CURRENT_DIR/files/usr/bin:$PATH
export LD_LIBRARY_PATH=$CURRENT_DIR/files/usr/lib
$*