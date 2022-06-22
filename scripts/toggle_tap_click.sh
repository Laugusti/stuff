#!/bin/sh
if [ "`gsettings get org.cinnamon.desktop.peripherals.touchpad tap-to-click`" == "true" ]; then
	gsettings set org.cinnamon.desktop.peripherals.touchpad tap-to-click false
else
	gsettings set org.cinnamon.desktop.peripherals.touchpad tap-to-click true
fi
