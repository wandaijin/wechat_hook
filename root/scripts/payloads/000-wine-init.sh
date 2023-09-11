#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes

wineboot -i &

echo "wait wineboot init launch"

xdotool search --sync --class 'wineboot' getwindowpid

while :
    do
       MONO_PID=$(xdotool search --name 'Wine Mono 安装器' getwindowpid)
       if [ ! -z ${MONO_PID} ]; then
            if [ ${MONO_PID} -ge 0 ]; then
                    sleep 0.5
                    xdotool key Tab
                    sleep 0.5
                    xdotool key Return
            fi
       fi
      

        WINEBOOT_PID=$(xdotool search --class 'wineboot' getwindowpid)
        if [ -z ${WINEBOOT_PID} ]; then
               break
        fi
        if [ ${WINEBOOT_PID} -ge 0 ]; then
                echo "wineboot initing"
                sleep 1
                continue
        fi
        break
    done

echo "wineboot init finished"