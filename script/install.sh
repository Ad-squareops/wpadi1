#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove --purge
sudo apt autoclean
sudo amazon-linux-extras install epel -y
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo apt install php php-fpm php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo apt install nginx unzip php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-fpm php-mysql -y
sudo systemctl reload php7.4-fpm.service
sudo systemctl reload nginx
