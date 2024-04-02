#!/bin/bash

sudo dpkg -i $1
sudo apt install -f
sudo apt install apt-transport-https
sudo apt update
sudo apt install code 
