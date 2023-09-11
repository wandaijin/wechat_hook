#!/usr/bin/env bash
function monitor() {
    while :
    do
        FUNTOOL_PID=$(xdotool search --class 'funtool_wx_3.9.2.23.exe')

        if [ ! -z "${FUNTOOL_PID}" ]; then
            echo "funtool is running." ${FUNTOOL_PID}
            sleep 10
            continue
        fi

        echo "funtool isn't running. starting..."

        wine 'C:\installer\funtool_wx_3.9.2.23.exe' &
        sleep 10

        xdotool search --sync --class 'funtool_wx_3.9.2.23.exe'
        sleep 0.5
        xdotool key Tab
        sleep 0.5
        xdotool key Return

        # close funtool window
        sleep 0.5
        xdotool  windowminimize $(xdotool getactivewindow)

        # open wechat
        sleep 0.5
        xdotool windowmap $(xdotool search  --name "微信")
    done
}

monitor
