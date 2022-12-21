#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo apt install nginx unzip php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
cd wordpress/
sudo cp -r * /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
cd /etc/nginx/sites-enabled/
sudo wget https://github.com/Ad-squareops/Adi/archive/refs/heads/main.zip
sudo unzip main.zip
sudo mv nginx-configuration-main/wordpress /etc/nginx/sites-enabled/
sudo systemctl reload php7.4-fpm.service
sudo rm -rf default main.zip nginx-configuration-main/
sudo systemctl reload nginx
sudo apt install mysql-server -y
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
cd ../../..

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

# AmazonCloudWatchAgent installation
sudo wget https://s3.us-east-2.amazonaws.com/amazoncloudwatch-agent-us-east-2/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb

#aws cli installation
sudo snap install aws-cli --classic 
sudo apt autoremove --purge
sudo apt autoclean
