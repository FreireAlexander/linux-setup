#!/bin/sh

active_window=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5|sed -e 's/../0&/2')

current_display=$(wmctrl -d|grep "*"|awk '{print $1}')

#########################
# Active Current Windows
#
color_foreground="a2d1ec" # Blue
color_underline="a2d1ec" 
color_foreground_inactive="ffffff" 
color_underline_inactive="ffffff" 
# active_window_decoration_style_left_side
awdsls="%{F#$color_foreground}%{+u}%{u#$color_underline}"
# active_window_decoration_style_right_side
awdsrs="%{-u}%{F-}"
# inactive_window_decoration_style_left_side
iwdsls="%{F#$color_foreground_inactive}%{+u}%{u#$color_underline_inactive}"
# inactive_window_decoration_style_right_side
iwdsrs="%{-u}%{F-}"
#
# Use this if you want to display windows in order they were opened
current_windows=$(wmctrl -lx | awk -v cd="$current_display" -v aw="$active_window" -v awdsls="$awdsls" -v awdsrs="$awdsrs" -v iwdsls="$iwdsls" -v iwdsrs="$iwdsrs" '

	{
		if ($2==cd) {
			split($3,window_title,".")
			if (window_title[1] == "code-oss"){window_title[1] ="󰨞 Code"}
			if (window_title[1] == "kitty"){window_title[1] ="󰄛 Kitty"}
			if (window_title[1] == "thunar"){window_title[1] =" Explorer"}
			if (window_title[1] == "Navigator"){window_title[1] =" Firefox"}
			if (window_title[1] == "google-chrome"){window_title[1] ="  Google"}
			if (window_title[1] == "spotify"){window_title[1] =" Spotify"}
			if ($1==aw) {
				window_title[1]=awdsls window_title[1] awdsrs
				print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
			}
			if ($1!=aw) {
				window_title[1]=iwdsls window_title[1] iwdsrs
				print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
			}
		}
	}')

# 

# Use this if you want to display windows active first
active_current_window=$(wmctrl -lx | awk -v cd="$current_display" -v aw="$active_window" -v awdsls="$awdsls" -v awdsrs="$awdsrs" -v iwdsls="$iwdsls" -v iwdsrs="$iwdsrs" '

	{
		if ($2==cd) {
			split($3,window_title,".")
			if ($1==aw) {
				
				window_title[1]=awdsls window_title[1] awdsrs
				print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
			}
		}
	}')

inactive_current_windows=$(wmctrl -lx | awk -v cd="$current_display" -v aw="$active_window" -v awdsls="$awdsls" -v awdsrs="$awdsrs" -v iwdsls="$iwdsls" -v iwdsrs="$iwdsrs" '

	{
		if ($2==cd) {
			split($3,window_title,".")
			if ($1!=aw) {
				window_title[1]=iwdsls window_title[1] iwdsrs
				print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"
			}
		}
	}')

# Use this if you want to display windows in order they were opened
echo $current_windows
# Use this if you want to display windows in order they were opened
#echo $current_windows