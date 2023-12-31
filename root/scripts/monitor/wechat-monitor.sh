#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes

function errmonitor() {
    while :
    do
        for i in `xdotool search --onlyvisible --class WeChat.exe`
        do
            NAME=`xdotool getwindowname $i`
            echo "window name: $NAME"
            if [ "$NAME" == "" ] || [ "$NAME" == "微信电脑版更新" ]; then
                xdotool windowunmap $i
            fi
        done
        
        for i in `xdotool search --onlyvisible --class wine`
        do
            NAME=`xdotool getwindowname $i`
            echo "window name: $NAME"
            if [ "$NAME" == "程序错误" ]; then
                xdotool windowkill $i
            fi
        done
        sleep 1
    done
}
errmonitor 
