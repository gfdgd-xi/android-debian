#!/bin/bash
export DISPLAY=:1
neofetch
rm -rfv /tmp/.X1*
vncserver :1
kwin_x11 &
deepin-wine-runner &
echo 等待用户自行退出
while [ 1 ]
do
	sleep 100
done
