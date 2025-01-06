#!/bin/bash
sudo su
yum update -y
yum install httpd git -y
systemctl start httpd
systemctl enable httpd
REPO_URL="https://github.com/jojoops/website.git"
TEMP_DIR=$(mktemp -d)
git clone $REPO_URL $TEMP_DIR
rm -rf /var/www/html/*
cp -r $TEMP_DIR/* /var/www/html/
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
systemctl restart httpd
rm -rf $TEMP_DIR
echo "Web server setup is complete. Your website is live!"
