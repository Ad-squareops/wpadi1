#!/bin/bash
sudo systemctl start nginx
sudo systemctl reload nginx
sudo systemctl start codedeploy-agent
