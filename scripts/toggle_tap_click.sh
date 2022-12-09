#!/bin/sh
if [ "`xinput list-props "Synaptics TM3471-010" | awk '/libinput Tapping Enabled \(/ {print $5}'`" == "1" ]; then
	xinput set-prop "Synaptics TM3471-010" "libinput Tapping Enabled" 0
else
	xinput set-prop "Synaptics TM3471-010" "libinput Tapping Enabled" 1
fi
