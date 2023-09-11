#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes

wine 'C:\installer\WeChatSetup-3.9.2.23.exe' &

echo "wait WeChatSetup launch"

## unpacking
echo "WeChatSetup unpacking data"
xdotool search --sync --name 'unpacking.*' getwindowpid
while :
    do
        UNPACK_PID=$(xdotool search --name 'unpacking.*' getwindowpid)

        if [ -z ${UNPACK_PID} ]; then
               break
        fi
        
        if [ ${UNPACK_PID} -ge 0 ]; then
                echo "unpacking"
                sleep 1
                continue
        fi

        break
    done
echo "WeChatSetup unpacking data finish"


xdotool search --sync --name '微信安装向导' windowactivate

## click to install
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key space
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Return

##finsh install
xdotool search --sync --name '微信 安装' 
sleep 60

##close install window
xdotool key Tab
sleep 0.5
xdotool key Tab
sleep 0.5
xdotool key Return