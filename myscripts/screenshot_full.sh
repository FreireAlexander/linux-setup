#!/bin/sh

maim -g $(xrandr | grep -w $(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .output') \
| grep -Eo '([0-9]{0,4}x[0-9]{0,4}[+][0-9]{0,4}[+][0-9]{0,4})') -u \
| tee /home/zero/Pictures/screenshots/Screenshot_$(date +%d%b%Y_%I_%M_%S%p).png \
| xclip -selection clipboard -t image/png