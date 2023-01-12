#!/bin/bash
sudo systemctl start nginx
sudo systemctl reload nginx
sudo systemctl reload php7.4-fpm.service
