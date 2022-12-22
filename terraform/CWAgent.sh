#!/bin/bash
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo apt install unzip -y
sudo wget https://github.com/Ad-squareops/temp/archive/refs/heads/main.zip
sudo unzip main.zip
sudo mv temp-main/amazon-cloudwatch-agent.json .
sudo rm -rf main.zip temp-main/
sudo chmod 777 amazon-cloudwatch-agent.json
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:amazon-cloudwatch-agent.json
