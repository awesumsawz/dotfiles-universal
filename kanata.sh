#!/bin/bash

start_tray() {
    echo "Starting Kanata Tray..."
    ~/.config/kanata-tray/kanata-tray-macos &
    disown
    echo "Kanata Tray startup complete!"
}

stop_tray() {
    if pgrep -f "kanata-tray-macos" > /dev/null; then
        echo "Stopping Kanata Tray..."
        pkill -f "kanata-tray-macos"
        sleep 1
        echo "Kanata Tray stopped."
    else
        echo "No Kanata Tray process found."
    fi
}

case "$1" in
    start)
        stop_tray  # First stop any existing instance
        start_tray
        ;;
    stop)
        stop_tray
        ;;
    restart)
        stop_tray
        start_tray
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit 0 