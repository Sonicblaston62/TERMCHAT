@echo off
:: %1 %2 and %3 are the first three arguments that are passed along the script
set ip=%1
set snd_port=%2
set rcv_port=%3
:: set 5000 and 5001 as default ports
if "%snd_port%"=="" set port=5000
if "%rcv_port%"=="" set port=5001

if [%1] == [] (
    echo For help, type /?
) else (
    if [%1] == [/?] (
        echo :
        echo : Usage: "<NAME>.bat <Other_Device_Ip> <PORT>"
        echo :
        echo : If no port is specified, port 5000 will be used
    ) else (
        cls
        title Sender
        :: Open new terminal window, print to console, change window name to "Receiver" and then listen for incoming requests
        start cmd /k echo Incoming messages will appear here ^& title Receiver ^& ncat -u -l -p %port%
        echo write and send messages here
        :: Sends the input text to the selected ip and port
        ncat -u %ip% %port%
    )
)