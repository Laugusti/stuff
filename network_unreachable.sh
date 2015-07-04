#!/usr/bin/sh
ping 192.168.10.1 -c3

if [ $(echo $?) -ne 0 ]
then
	reboot #needs to be exeucted as root
	#TODO: should restart the network only? HOW??
	exit 1
fi
