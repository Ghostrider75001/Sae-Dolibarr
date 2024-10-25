#!/bin/bash

# Installation Apache, PHP and  modules
apt update
apt install -y apache2
apt install -y php8.2 php8.2-common php8.2-imap libapache2-mod-php8.2 php8.2-cli php8.2-common php8.2-curl php8.2-gd php8.2-intl php8.2-mbstring php8.2-mysql php8.2-opcache php8.2-readline php8.2-xml php8.2-zip
systemctl enable apache2 && systemctl start apache2


# Install the MariaDB database server
apt install -y mariadb-server
systemctl start mariadb && systemctl enable mariadb

# Sécurise l'installation de MySQL
sudo mysql_secure_installation <<EOF
y
root
root
y
y
y
y
EOF

# Create Database and Database User
mysql -u root -proot -e "CREATE DATABASE dolibarr;"
mysql -u root -proot -e "CREATE USER 'dolibarr'@'localhost' IDENTIFIED BY 'root';"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON dolibarr.* TO 'dolibarr'@'localhost';"
mysql -u root -proot -e "FLUSH PRIVILEGES;"


# Download the latest version of Dolibarr via sourceforge
wget https://sourceforge.net/projects/dolibarr/files/latest/download -O dolibarr.zip

# Unzip the downloaded file
unzip dolibarr.zip

# Move Dolibarr in the Apache's directory
mkdir /var/www/html/dolibarr/
mv dolibarr-20.0.1/* /var/www/html/dolibarr/

# Change Dolibarr folder permissions
chown -R www-data:www-data /var/www/html/dolibarr/
chmod -R 755 /var/www/html/dolibarr/

# Disable the default Apache virtual host configuration
sudo a2dissite 000-default.conf

# Create Apache Virtual Host File for Dolibarr
cat <<EOL > /etc/apache2/sites-available/dolibarr.conf
<VirtualHost *:80>

ServerAdmin admin@dolibarr.com
ServerName dolibarr.com
ServerAlias dolibarr

DocumentRoot /var/www/html/dolibarr/
DirectoryIndex index.php index.html

ErrorLog ${APACHE_LOG_DIR}/dolibarr-error.log
CustomLog ${APACHE_LOG_DIR}/dolibarr-access.logb comined

</VirtualHost>
EOL

# Enable Apache module for rewrite URLs
sudo a2ensite default-ssl
sudo a2enmod ssl
a2ensite dolibarr.conf

# Check the syntax of the Apache2 configuration.
apachectl -t

# Restart Apache to apply changes
sudo systemctl reload apache2
systemctl restart apache2

# Shwo Dolibarr's URL access
echo "Dolibarr est installé et accessible à l'adresse http://localhost/htdocs/install/index.php"
