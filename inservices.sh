#!/bin/bash

# Inservice - Monitoring your server from incoming user
# Agung Riyadi @2017.

# This application to monitoring who access nagios server or other client computer from remote computer. 
# So you can prevent your server from people attack or unknown user login into your server.
# This application should be copy to $NAGIOSROOT/libexec, change owner to your nagios group/owner
# You can use this application to monitoring  ssh connection, ftp connection, postgres, mysql, etc who enter from remote computer
# You can write IP address into whitelist if theres allowed user to access your server.

# USAGE:  ./inservices ssh              #For monitoring your ssh.
# USAGE:  ./inservices ftp              #For monitoring your ftp.
# USAGE:  ./inservices postgres         #For monitoring your postgres.

# Output 1: WARNING.(10:58:13)# 1connection unknown (192.168.249.230) 
#
# Other Output: SAFE.(10:58:13)# 2connection (192.168.249.224, 192.168.249.222) 
# 
# Every WARNING output will write inside inservices.log
#


#checking input from netstat to monitoring your server
cmonitor=$1
cek=`netstat | grep $cmonitor | grep ESTABLISHED | awk '{ print $5 }' | cut -d: -f1 | sort -u`

#read whitelist
wlist=`cat < ./whitelist`

#if no file whitelist we generate it first
[ -f ./whitelist ] || echo "127.0.0.1" > whitelist


#if no file log we generate it first
waktu=`date +"%T"`
[ -f ./inservice.log ] || echo "(INSTALL).$waktu# Inservices installed" > inservice.log

icon=0       #count connection 
isafe=0      #count safe connection
iwarn=0      #count warning connection
tsafe=""
twarn=""

#whitelist check
for item in $cek
do
  ((icon++))
  if echo "$wlist" | grep -q "$item"; then

    #match
      ((isafe++))
      tsafe="$tsafe, $item"
      #echo $item "safe connection"   
    else
    #unmatch
      twarn="$twarn, $item"
      ((iwarn++))          
     #echo $item "not in whitelist"
  fi

done


#remove substring 
tsafe=${tsafe:2}
twarn=${twarn:2}


if [ $iwarn -eq 0 ]; then
#if iwarn=0, its safe, all inside whitelist or no ip coming 
 echo "SAFE.($waktu)# $icon""connection ($tsafe) on your $cmonitor"
 exit 0
else
#if iwarn>0, print all warning incoming ip
 echo "WARNING.($waktu)# $iwarn""connection unknown ($twarn) on your $cmonitor" >> inservices.log
 exit 1
fi
