#!/bin/bash
# 参数 1 为分辨率宽，2为高
export DISPLAY=:1
# 修改默认语言
export LANG=zh_CN.UTF-8
# 禁用 sandbox 以便可以让星火可以正常使用
export QTWEBENGINE_DISABLE_SANDBOX=1  
#neofetch
# 删除文件以便 vncserver 可以正常在 :1 开启
rm -rfv /tmp/.X1*
cd /tmp
# 开启 VNC 服务（只允许本机访问）
if [ $# -eq 0 ]; then
	vncserver $DISPLAY #-localhost
else
	vncserver $DISPLAY -geometry ${1}x${2} #-localhost
fi
# 打开窗口管理器
startxfce4 &
xfce4-terminal &
# 开启 NoVNC 服务（只允许本机访问）
/novnc/utils/novnc_proxy --vnc localhost:5901 & #--listen localhost:6080 &
echo 等待用户自行退出
while true ; do
	monitor=`ps -ef | grep novnc_proxy | grep -v grep | wc -l ` 
	# 检查 vnc 服务是否正常运行
	if [ $monitor -eq 0 ] 
	then
		echo "NoVNC had exited, restart"
		/novnc/utils/novnc_proxy --vnc localhost:5901 --listen localhost:6080 &
	fi
	sleep 10
done