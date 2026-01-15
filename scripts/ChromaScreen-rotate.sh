#!/bin/bash
export DISPLAY=:0

# Wait for X to be ready (xrandr will fail until it is)
for i in $(seq 1 40); do
  xrandr --query >/dev/null 2>&1 && break
  sleep 0.25
done

# Rotate the Touch Display 2 output
xrandr --output DSI-1 --mode 720x1280 --rotate left --pos 0x0

# Rotate touch to match display (xrandr --rotate right)
xinput set-prop 6 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
