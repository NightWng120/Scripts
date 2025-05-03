#!/bin/bash
ssid=$(iwlist wlp4s0 scan | grep SSID | awk -F '"' '{print $2}')
echo "Is $ssid the network you want to connect to?"
read input
if [ "${input,,}" = yes ] ; then
	echo "Please enter the password"
	read password
else
	echo "Enter SSID"
	read ssid
	echo "Enter password"
	read password
fi

# echo $ssid
# echo $password

wpa_passphrase $ssid $password | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf && sudo systemctl restart wpa_supplicant.service && sudo systemctl restart dhclient.service
