#!/bin/bash
cd /home/pi/heartbeat-master/install

# install deps
sudo apt-get install --yes dnsmasq hostapd

# deny wan0
/bin/cp -rf acconfig/dhcpcd.conf /etc/dhcpcd.conf

# reconfigure wlan
/bin/cp -rf acconfig/interfaces /etc/network/interfaces

sudo service dhcpcd restart
sudo ifdown wlan0; sudo ifup wlan0

# copy hostapd config
/bin/cp -rf acconfig/hostapd.conf /etc/hostapd/hostapd.conf
/bin/cp -rf acconfig/hostapd /etc/default/hostapd

# configure dnsmasq
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
/bin/cp -rf acconfig/dnsmasq.conf /etc/dnsmasq.conf

# setup ipv4 forwarding
/bin/cp -rf acconfig/sysctl.conf /etc/sysctl.conf

# impatiant start
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

# create a NAT for internet sharing
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

# save rules
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

# set rules for startup
/bin/cp -rf acconfig/rc.local /etc/rc.local

# start services
sudo service hostapd start
sudo service dnsmasq start