#!bin/bash


#variables
export mysqlhost=$"group3-mariadb-server-364480898.mariadb.database.azure.com"
export mysqldb=$"wordpress"
export mysqluser=$"thewarriors@group3-mariadb-server-364480898"
export mysqlpass=$"Azuregroup3brief7@"
export wptitle=$"group3"
export wpuser=$"thewarriors"
export wppass=$"Azuregroup3brief7@"
export wpemail=$"email@email.com"
export siteurl=$"20.19.96.83"

sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz -C /var/www/html/
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo wget -O /tmp/wp.keys https://api.wordpress.org/secret-key/1.1/salt/

sudo chmod go+wx /var/www/html/wordpress/wp-config.php
sudo chmod go+wx /var/www/html/wordpress/wp-config-sample.php

sudo sed -i -e "s/localhost/"$mysqlhost"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/database_name_here/"$mysqldb"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/username_here/"$mysqluser"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/password_here/"$mysqlpass"/g" /var/www/html/wordpress/wp-config.php


sudo rm latest.tar.gz
sudo rm /tmp/wp.keys


