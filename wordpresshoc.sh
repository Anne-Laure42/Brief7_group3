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

#telecharger wordpress
sudo wget https://wordpress.org/latest.tar.gz

#dézipper le fichier
sudo tar -xvzf latest.tar.gz -C /var/www/html/

#copier le fichier wp-config.php
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

#télécharger l'api secret-key
sudo wget -O /tmp/wp.keys https://api.wordpress.org/secret-key/1.1/salt/

#pour créer la base de donnée maria db sur azure on'a utilisé la commande :
#mysql -h group3-mariadb-server-364480898.mariadb.database.azure.com -u thewarriors@group3-mariadb-server-364480898 -p
#CREATE DATABASE wordpress;


#changer le mode d'écriture et d'édition des fichiers
sudo chmod go+wx /var/www/html/wordpress/wp-config.php
sudo chmod go+wx /var/www/html/wordpress/wp-config-sample.php

#changer les paramètres wp-config
sudo sed -i -e "s/localhost/"$mysqlhost"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/database_name_here/"$mysqldb"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/username_here/"$mysqluser"/g" /var/www/html/wordpress/wp-config.php
sudo sed -i -e "s/password_here/"$mysqlpass"/g" /var/www/html/wordpress/wp-config.php

#supprimer le fihier zippé du début
sudo rm latest.tar.gz

#supprimer le wp.keys
sudo rm /tmp/wp.keys


