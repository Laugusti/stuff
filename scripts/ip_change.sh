#!/usr/bin/sh

#Verify # of arguments
if [ $# -ne 2 ]
then
	echo "Usage: $0 [CREDENTIALS] [ADDRESS]"
	exit 1
fi

#Get current ip address
curr_ip=$(curl -su $1 192.168.10.1/updateInfoForStatusPage.cgi | cut -d, -f2 | sed "s/\s//g" | egrep "^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}$")

if [ -z ${curr_ip} ] || [ "192.168.100.10" = ${curr_ip} ]
then
	#Failed to get external ip address
	exit 1
fi

old_ip=$(tail -1 ${HOME}/.ip_addr 2>/dev/null)


if [ "$curr_ip" != "$old_ip" ]
then
	echo ${curr_ip} | mailx -s "ip change" $2 
	echo ${curr_ip} >> ${HOME}/.ip_addr
fi
