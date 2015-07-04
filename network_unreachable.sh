#!/usr/bin/sh

#attempt to ping the router
ping 192.168.10.1 -c3

#result of ping is non-zero aka network is unreachable
if [ $(echo $?) -ne 0 ]
then
	#restart the network (requires root access)
	netctl restart wireless-wpa-config
fi
