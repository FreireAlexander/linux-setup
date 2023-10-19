#!/bin/sh


# Options
shutdown=''
reboot=''
lock=''
suspend='󰤄'
logout='󰍃'
yes='󰄳 yes'
no='󰞇 no'

rofi_powermenu(){
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" \
	| rofi -dmenu -theme ~/.config/rofi/powermenus/powermenu.rasi ;
}

rofi_confirmation(){
	echo -e "$yes\n$no" \
	| rofi -dmenu -theme ~/.config/rofi/confirmationmenus/confirmationmenu.rasi ;
}

choice=$(rofi_powermenu)
case ${choice} in
    $shutdown)
    confirmation=$(rofi_confirmation)
    case ${confirmation} in
      $yes)
      shutdown +1 &
      echo "PC will shut down in a minute" | rofi -dmenu -theme-str 'element-text {background-color: @DarkRed;text-color: @Cornsilk;}' -theme ~/.config/rofi/messages/messages.rasi
    esac
		    ;;
    $reboot)
    confirmation=$(rofi_confirmation)
    case ${confirmation} in
      $yes)
      shutdown -r +1 &
      echo "PC will reboot in a minute" | rofi -dmenu -theme-str 'element-text {background-color: @DarkRed;text-color: @Cornsilk;}' -theme ~/.config/rofi/messages/messages.rasi
    esac
        ;;
    $lock)
		  ~/.config/myscripts/lock.sh
        ;;
    $suspend)
		  systemctl suspend
        ;;
    $logout)
    confirmation=$(rofi_confirmation)
    case ${confirmation} in
      $yes)
		  i3-msg exit
    esac
        ;;
esac
