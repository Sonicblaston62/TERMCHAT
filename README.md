# TERMCHAT
This repository contains a batch and bash script that let's you send messages between two computers

# Windows
To run, download chat.bat

install nmap from nmap.org/download.html

open the commandline in the location you placed the script

run it like this
```
chat.bat <Other_machine_Ip> [Port]
```
this will open a new window

You write your message in the original window and can see replies in the one

# Linux

Download chat.sh

Open a terminal window in the location you placed the script

run it like this
```
./chat.sh <Other_Machine_Ip> [Receiving_Port] [Sending_Port]
```
You will be able to send and receive messages in the same terminal window

Currently the windows and linux version of the script does not have the same functionality
as seen by the two ports needed for linux. this will be added to windows as well as it is neccecarry to allow both scripts to be able to talk to eachother between OS's
