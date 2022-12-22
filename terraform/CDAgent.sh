#!/bin/bash
# code deploy agnet installation
sudo apt update
sudo apt list --upgradable
sudo apt install ruby-full -y
sudo apt install wget -y
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto > /tmp/logfile
sleep 15
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent
