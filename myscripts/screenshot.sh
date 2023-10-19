#!/bin/sh

maim -s | tee /home/zero/Pictures/screenshots/Screenshot_$(date +%d%b%Y_%I_%M_%S%p).png | xclip -selection clipboard -t image/png