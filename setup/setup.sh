#!/system/bin/sh
echo setup.sh $1
#cd $1

chmod +x run.sh
chmod +x proot
chmod +x loader

chmod +x debian12_aarch64/usr/bin/env
chmod +x debian12_aarch64/usr/bin/deno

mkdir -p tmp
mkdir -p debian12_aarch64/tmp

ln -s usr/lib debian12_aarch64/lib
ln -s aarch64-linux-gnu/ld-linux-aarch64.so.1 debian12_aarch64/usr/lib/ld-linux-aarch64.so.1

echo setup ok.

