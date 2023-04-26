#!/bin/bash
# yum update -y
#yum install -y httpd.x86_64
#systemctl start httpd.service
#systemctl enable httpd.service
#echo "Hello World from $(hostname -f)" > /var/www/html/index.html 

apt-get update -y 
apt-get install apache2 -y 
systemctl start apache2
systemctl enable apache2
add-apt-repository -y ppa:ondrej/php
apt install php5.6 mysql-client php5.6-mysqli -y
rm /var/www/html/index.html
cp -r /home/ubuntu/code /var/www/html/