# laravel and LAMP automatic setup
#!/bin/bash 
sudo apt-get update
#LAMP
sudo apt-get install apache2
sudo apt-get install mysql-server 
sudo apt-get install libapache2-mod-auth-mysql 
sudo apt-get install php7.0-mysql
sudo apt-get install php7.0 
sudo apt-get install libapache2-mod-php7.0 
sudo apt-get install php7.0-mcrypt 
sudo apt-get install php7.0-zip 
sudo apt-get install php7.0-xml 
sudo apt-get install php7.0-mbstring
#/LAMP
sudo apt-get upgrade
sudo apt-get install composer
sudo composer global require "laravel/installer" 
sudo service apache2 restart
echo "Type the project name: followed by [ENTER]"
read ProjectName
sudo ./.composer/vendor/bin/laravel new $ProjectName
sudo mv $ProjectName .composer/vendor
sudo mv .composer/vendor ../../var/www/html
echo "Change syntax at line 12 in /etc/apache2/sites-available/000-default.conf"
echo "/var/www/html -----> /var/www/html/vendor/$ProjectName/public"
