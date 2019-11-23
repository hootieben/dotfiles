#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

for monitor in $(xrandr -q | grep -e "\sconnected\s" | cut -d' ' -f1); do
    echo "Running for $monitor"
  MONITOR=$monitor polybar top &
  if [ "$(xrandr -q | grep -e "\sconnected\s" | grep -e "^$monitor" | grep -c primary)" == "1" ]; then
      echo "Primary monitor found: $monitor"
      MONITOR=$monitor polybar bottomwithtray &
  else
      echo "Not primary monitor: $monitor"
      MONITOR=$monitor polybar bottom &
  fi
done

echo "Bar launched..."
