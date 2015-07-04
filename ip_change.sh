#!/usr/bin/sh
curr_ip=$(curl "https://www.google.com/search?q=ayy" 2>/dev/null| grep 'Client IP address' | sed 's/.*Client IP address: //' | sed 's/).*//')

if [ -z $(echo ${curr_ip} | egrep '^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}$') ]
then
	#Failed to get external ip address
	exit 1
fi

old_ip=$(tail -1 ~leon4422/.ip_addr 2>/dev/null)


if [ "$curr_ip" != "$old_ip" ]
then
	echo ${curr_ip} >> ~leon4422/.ip_addr
	echo ${curr_ip} | mailx -s 'ip change' laugusti@mail.usf.edu
fi
