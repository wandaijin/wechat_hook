#!/usr/bin/env bash
set -ex

/scripts/run-gui.sh &
sleep 5
wine 'C:\Program Files (x86)\Tencent\WeChat\WeChat.exe' &
xdotool search --sync --onlyvisible --class WeChat.exe
/scripts/monitor/inject-monitor.sh &
sleep 5
/scripts/monitor/wechat-monitor.sh &
wait