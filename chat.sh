#!/bin/bash
IP=$1
# Set port to 5000 and 5001 by default
RCV_PORT=${2:-5000} 
SND_PORT=${3:-5001} 
MSG=""
echo Reciever port is: $RCV_PORT and Sender port is $SND_PORT

# if no input given then display help
if [ -z $IP ]; then
    echo for help, type --help or -h
    exit 0
fi
# show help if either -h or --help is entered as the argument
if [ $IP == "--help" ] || [ $IP == "-h" ]; then 
    echo :
    echo : Usage: "./chat.sh <IP> [RECEIVER_PORT] [SENDING_PORT]"
    echo :
    echo : If no port is specified, 5000 will be used for receiving
    echo : and 5001 for sending
    echo : each machine needs to be listening and sending on the opposite port of eachother
    echo : if machine 1 is listeing on port 5000, machine 2 will have to send on that port
    echo : machine 1 would have to send on port 5001 and machine 2 would have to listen on that port
    exit 0
fi
echo "Send and receive messages here"
# listen for all data on the specified port and run in background to allow for new input
nc -u -l -p $RCV_PORT &
# Sends the input text to the selected ip and port
while read MSG; do
    echo "$MSG" | nc -u $IP $SND_PORT
    echo "[Them] $MSG"
done 

