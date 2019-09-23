#!/bin/bash

killall -q ci3ipc
while pgrep -u $UID -x ci3ipc > /dev/null; do sleep 1; done
ci3ipc &
