#!/bin/bash
export HOME=/root/ 
export LANG=C.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin:/bin:/sbin
export XDG_RUNTIME_DIR=/run/user/0
export TMPDIR=/tmp
mkdir /run/user/0 -p
bash $@