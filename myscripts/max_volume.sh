#!/bin/bash

if pactl get-sink-volume @DEFAULT_SINK@ | grep "150%"
    then
        pactl set-sink-volume @DEFAULT_SINK@ 150%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +5%
fi