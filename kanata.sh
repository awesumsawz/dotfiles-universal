#!/bin/bash

start_tray() {
    echo "Starting Kanata..."
    sudo nohup '/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon' > /dev/null 2>&1 &
    sudo nohup kanata --quiet --nodelay --cfg ~/.config/kanata/kanata.kbd > /dev/null 2>&1 &
    sleep 10 
    echo "Kanata startup complete!"
}

stop_tray() {
    # Stop Kanata processes more aggressively
    echo "Stopping Kanata processes..."
    
    # Method 1: Try regular pkill first
    if pgrep -f "kanata" > /dev/null; then
        echo "Found Kanata process, terminating..."
        sudo pkill -f "kanata"
        sleep 2
        
        # Method 2: If still running, use SIGKILL
        if pgrep -f "kanata" > /dev/null; then
            echo "Kanata still running, force killing..."
            sudo pkill -9 -f "kanata"
            sleep 1
        fi
    else 
        echo "No Kanata process found."
    fi
    
    # Stop Karabiner daemon more aggressively
    echo "Stopping Karabiner daemon..."
    
    # Method 1: Try regular pkill first
    if pgrep -f "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
        echo "Found Karabiner daemon, terminating..."
        sudo pkill -f "Karabiner-VirtualHIDDevice-Daemon"
        sleep 2
        
        # Method 2: If still running, use SIGKILL
        if pgrep -f "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
            echo "Karabiner daemon still running, force killing..."
            sudo pkill -9 -f "Karabiner-VirtualHIDDevice-Daemon"
            sleep 1
        fi
        
        # Method 3: Kill by exact process name if pattern matching fails
        if pgrep "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
            echo "Using exact process name to kill Karabiner daemon..."
            sudo pkill -9 "Karabiner-VirtualHIDDevice-Daemon"
            sleep 1
        fi
    else
        echo "No Karabiner daemon found."
    fi
    
    # Final verification
    if pgrep -f "kanata\|Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
        echo "Warning: Some processes may still be running:"
        pgrep -fl "kanata\|Karabiner-VirtualHIDDevice-Daemon"
    else
        echo "All processes stopped successfully."
    fi
}

# Alternative stop function using more specific process identification
stop_tray_alternative() {
    echo "Stopping processes (alternative method)..."
    
    # Get PIDs and kill them individually
    KANATA_PIDS=$(pgrep -f "kanata.*\.kbd")
    DAEMON_PIDS=$(pgrep -f "Karabiner-VirtualHIDDevice-Daemon")
    
    if [ ! -z "$KANATA_PIDS" ]; then
        echo "Killing Kanata PIDs: $KANATA_PIDS"
        for pid in $KANATA_PIDS; do
            sudo kill $pid 2>/dev/null
            sleep 1
            # Force kill if still running
            if kill -0 $pid 2>/dev/null; then
                sudo kill -9 $pid 2>/dev/null
            fi
        done
    fi
    
    if [ ! -z "$DAEMON_PIDS" ]; then
        echo "Killing Daemon PIDs: $DAEMON_PIDS"
        for pid in $DAEMON_PIDS; do
            sudo kill $pid 2>/dev/null
            sleep 1
            # Force kill if still running
            if kill -0 $pid 2>/dev/null; then
                sudo kill -9 $pid 2>/dev/null
            fi
        done
    fi
    
    echo "Process termination complete."
}

case "$1" in
    start)
        stop_tray
        start_tray
        ;;
    stop)
        stop_tray
        ;;
    stop-alt)
        stop_tray_alternative
        ;;
    restart)
        stop_tray
        start_tray
        ;;
    status)
        echo "Checking process status..."
        if pgrep -f "kanata" > /dev/null; then
            echo "Kanata is running:"
            pgrep -fl "kanata"
        else
            echo "Kanata is not running."
        fi
        
        if pgrep -f "Karabiner-VirtualHIDDevice-Daemon" > /dev/null; then
            echo "Karabiner daemon is running:"
            pgrep -fl "Karabiner-VirtualHIDDevice-Daemon"
        else
            echo "Karabiner daemon is not running."
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|stop-alt|restart|status}"
        exit 1
        ;;
esac

exit 0
