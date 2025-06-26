#!/bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum install maven -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd 
echo "<h1>Welcome to the HTTP Server</h1>" | sudo tee /var/www/html/index.html