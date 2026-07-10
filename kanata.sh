#!/bin/bash
# Kanata launcher for macOS and Linux.
# macOS: needs the Karabiner VirtualHIDDevice daemon and sudo.
# Linux: runs unprivileged; needs input group membership and a udev rule
#        granting the input group access to /dev/uinput.

CFG="$HOME/.config/kanata/kanata.kbd"
LOG="$HOME/.cache/kanata.log"
DAEMON='/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon'
OS="$(uname -s)"

start_kanata() {
    if pgrep -x kanata > /dev/null; then
        echo "Kanata is already running."
        return
    fi
    echo "Starting Kanata..."
    if [ "$OS" = "Darwin" ]; then
        sudo nohup "$DAEMON" > /dev/null 2>&1 &
        sudo nohup kanata --quiet --nodelay --cfg "$CFG" > /dev/null 2>&1 &
        sleep 10
    else
        mkdir -p "$(dirname "$LOG")"
        nohup kanata --quiet --nodelay --cfg "$CFG" > "$LOG" 2>&1 &
        sleep 1
        if ! pgrep -x kanata > /dev/null; then
            echo "Kanata failed to start. Log output:"
            cat "$LOG"
            exit 1
        fi
    fi
    echo "Kanata startup complete!"
}

# $1: pgrep/pkill match flag (-x exact name, -f full cmdline), $2: pattern, $3: display name
kill_process() {
    local flag="$1" pattern="$2" name="$3"
    if pgrep "$flag" "$pattern" > /dev/null; then
        echo "Stopping $name..."
        $SUDO pkill "$flag" "$pattern"
        sleep 2
        if pgrep "$flag" "$pattern" > /dev/null; then
            echo "$name still running, force killing..."
            $SUDO pkill -9 "$flag" "$pattern"
            sleep 1
        fi
    else
        echo "No $name process found."
    fi
}

stop_kanata() {
    SUDO=""
    [ "$OS" = "Darwin" ] && SUDO="sudo"

    kill_process -x "kanata" "Kanata"
    if [ "$OS" = "Darwin" ]; then
        kill_process -f "Karabiner-VirtualHIDDevice-Daemon" "Karabiner daemon"
    fi

    if pgrep -x kanata > /dev/null || pgrep -f "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
        echo "Warning: Some processes may still be running."
    else
        echo "All processes stopped successfully."
    fi
}

case "$1" in
    start)
        start_kanata
        ;;
    stop)
        stop_kanata
        ;;
    restart)
        stop_kanata
        start_kanata
        ;;
    status)
        if pgrep -x kanata > /dev/null; then
            echo "Kanata is running:"
            pgrep -ax kanata 2>/dev/null || pgrep -fl kanata
        else
            echo "Kanata is not running."
        fi
        if [ "$OS" = "Darwin" ]; then
            if pgrep -f "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
                echo "Karabiner daemon is running."
            else
                echo "Karabiner daemon is not running."
            fi
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

exit 0
