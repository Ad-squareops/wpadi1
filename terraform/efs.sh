sudo apt update
sudo apt install nfs-common -y
cd /var/www/html
sudo chmod 777 wp-content
sleep 30
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport DNS_name_of_your_EFS:/ wp-content
echo "DNS_name_of_your_EFS:/ /var/www/html/wp-content nfs defaults,_netdev 0 0" >> /etc/fstab
