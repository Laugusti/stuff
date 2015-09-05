#!/usr/bin/sh

#attempt to ping the router
ping 192.168.10.1 -c3 >/dev/null 2>&1

#result of ping is non-zero aka network is unreachable
if [ $? -ne 0 ]
then
	#bring down the network (requires root access)
	ip link set wlan0 down
	#stop the network (requires root access)
	netctl stop wireless-wpa-config
	#start the network (requires root access)
	netctl start wireless-wpa-config
fi
