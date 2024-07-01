#!/bin/bash
export DISPLAY=:1
# 修改默认语言
export LANG=zh_CN.UTF-8
# 禁用 sandbox 以便可以让星火可以正常使用
export QTWEBENGINE_DISABLE_SANDBOX=1  
#neofetch
# 删除文件以便 vncserver 可以正常在 :1 开启
rm -rfv /tmp/.X1*
vncserver :1
icewm &
deepin-wine-runner &
echo 等待用户自行退出
while [ 1 ]
do
	sleep 100
done
