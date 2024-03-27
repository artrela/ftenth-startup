#!/bin/bash

sudo dpkg -i $1
sudo apt install apt-transport-https
sudo apt update
sudo apt install code 
