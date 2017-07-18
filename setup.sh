# laravel and LAMP automatic setup
#!/bin/bash 
sudo apt-get update
#LAMP
sudo apt-get install apache2
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get install php7.0 libapache2-mod-php7.0 php7.0-mcrypt
#/LAMP
sudo apt-get upgrade
sudo apt-get install php7.0-zip php7.0-xml php7.0-mbstring
sudo apt-get install composer
sudo composer global require "laravel/installer" 
sudo service apache2 restart
echo "Type the project name: followed by [ENTER]"
read ProjectName
sudo ./.composer/vendor/bin/laravel new $ProjectName
sudo mv $ProjectName .composer/vendor
