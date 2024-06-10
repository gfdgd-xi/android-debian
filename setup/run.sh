#!/system/bin/sh
export LD_LIBRARY_PATH=$(pwd)

export PROOT_TMP_DIR=$(pwd)/tmp
export PROOT_LOADER=$(pwd)/loader

export BOTTLEPATH=debian12_aarch64
# 拷贝 loader
if [[ ! -f $$BOTTLEPATH ]]; then
  cp -v loader.sh $BOTTLEPATH/loader.sh
fi

cp loader.sh

./proot \
  --bind=$BOTTLEPATH/tmp:/dev/shm \
  --bind=/sys \
  --bind=/proc/self/fd/2:/dev/stderr \
  --bind=/proc/self/fd/1:/dev/stdout \
  --bind=/proc/self/fd/0:/dev/stdin \
  --bind=/proc/self/fd:/dev/fd \
  --bind=/proc \
  --bind=/dev/urandom:/dev/random \
  --bind=/dev \
  -L \
  --kernel-release=6.2.1-PRoot-Distro \
  --sysvipc \
  --link2symlink \
  --kill-on-exit \
  --cwd=/ \
  --change-id=0:0 \
  --rootfs=$BOTTLEPATH \
  /bin/bash /loader.sh "$@"

