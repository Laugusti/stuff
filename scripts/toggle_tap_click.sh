#!/bin/sh
if [ "`gsettings get org.cinnamon.settings-daemon.peripherals.touchpad tap-to-click`" == "true" ]; then
	gsettings set org.cinnamon.settings-daemon.peripherals.touchpad tap-to-click false
else
	gsettings set org.cinnamon.settings-daemon.peripherals.touchpad tap-to-click true
fi
