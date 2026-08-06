@echo off
:: %1 %2 and %3 are the first three arguments that are passed along the script
set ip=%1
set rcv_port=%2
set snd_port=%3

:: set 5000 and 5001 as default ports
if "%rcv_port%"=="" set "rcv_port=5001"
if "%snd_port%"=="" set "snd_port=5000"

if [%1] == [] (
    echo For help, type /?
    exit /b
)
if [%1] == [/?] (
    echo :
    echo : Usage: 
    echo : "chat.bat <Other_Device_Ip> <RECEIVER_PORT> <SENDER_PORT>"
    echo :
    echo : If no port is specified, 5000 will be used for receiving and 5001 for sending.
    echo : 
    echo : Each machine needs to be listening and sending on the opposite port of each other.
    echo : If machine 1 is listening on port 5000, machine 2 will have to send on that port.
    echo : Machine 1 would have to send on port 5001 and machine 2 would have to listen on that port.
    echo :
    echo : IMPORTANT before you run this script you need to install NetCat.
    echo : You can download that here: https://nmap.org/download.html#windows
)
cls
title Sender
:: Open new terminal window, print to console, change window name to "Receiver" and then listen for incoming requests
start cmd /k echo Incoming messages will appear here ^& title Receiver ^& ncat -u -l -p %rcv_port%
echo write and send messages here
:: Sends the input text to the selected ip and port
ncat -u %ip% %snd_port%