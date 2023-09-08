#!/usr/bin/env bash
INJMON_LOG_FILE=${INJMON_LOG_FILE:-/dev/stdout}
function monitor() {
    while :
    do
        if [ "$INJ_CONDITION" != "" ]; then
            bash -c "$INJ_CONDITION"
            if [ "$?" = "0" ]; then
                echo "funtool is running."
                continue
            fi
            echo "funtool isn't running. starting..."
        fi

        wine 'C:\install\funtool_wx_3.9.2.23.exe' &
        
        sleep 10
    done
}
monitor
