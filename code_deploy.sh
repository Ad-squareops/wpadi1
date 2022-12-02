!/bin/bash

sudo apt-get update

sudo apt-get install ruby-full ruby-webrick wget -y

cd /tmp

sudo wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb

sudo mkdir codedeploy-agent_1.3.2-1902_ubuntu22

sudo dpkg-deb -R codedeploy-agent_1.3.2-1902_all.deb codedeploy-agent_1.3.2-1902_ubuntu22

sudo sed 's/Depends:.*/Depends:ruby3.0/' -i ./codedeploy-agent_1.3.2-1902_ubuntu22/DEBIAN/control

sudo dpkg-deb -b codedeploy-agent_1.3.2-1902_ubuntu22/

sudo dpkg -i codedeploy-agent_1.3.2-1902_ubuntu22.deb

sudo systemctl list-units --type=service | grep codedeploy

sudo service codedeploy-agent status
