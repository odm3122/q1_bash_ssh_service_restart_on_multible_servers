#!/bin/bash
# Linux with ssh key based login
SERVERS="192.168.20.1 192.168.20.2 192.168.20.3"
# SSH User name
USR="odm"
 
# Email 
SUBJECT="Restart Webservers"
EMAILADDR="admin@swisscom.com"
EMAILMSG="/tmp/emailmsg.txt"
 
# create new file
>$EMAILMSG
 
# connect each host and pull up user listing
for host in $SERVERS
do
echo "--------------------------------" >>$EMAILMSG
echo "* HOST: $host " >>$EMAILMSG
echo "--------------------------------" >>$EMAILMSG

ssh -t $USR@$host "sudo service apache2 restart" &>>$EMAILMSG
done
# send an email using /bin/mail
/bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMSG