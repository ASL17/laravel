# laravel and LAMP automatic setup
#!/bin/bash 
sudo apt-get update

#LAMP
sudo apt-get install php7.0 -y

sudo apt-get install apache2 -y
sudo apt-get install libapache2-mod-php7.0 -y

sudo apt-get install mysql-server -y
sudo apt-get install libapache2-mod-auth-mysql -y
sudo apt-get install php7.0-mysql -y


#/LAMP

sudo apt-get upgrade

sudo apt-get install php7.0-mcrypt -y
sudo apt-get install php7.0-zip -y
sudo apt-get install php7.0-xml -y
sudo apt-get install php7.0-mbstring -y
sudo apt-get install composer -y
sudo composer global require "laravel/installer" 
sudo service apache2 restart

#downloading the other script that permits creation of laravel projects

sudo wget https://raw.githubusercontent.com/bello12/laravel/master/ProjectCreator.sh
sudo chmod +x ProjectCreator.sh

echo 'Do you want to proceed to the first Laravel Project setup? [Y/n]'
read WantsProjectSetup

#todo: check of the WantsProjectSetup ( 'do { read WantsProjectSetup } until (!isInputValid)' )  

WantsProjectSetup=${WantsProjectSetup,,}

if [ $WantsProjectSetup = 'y' ] || [ $WantsProjectSetup = 'yes' ]
then
        echo 'Executing script ProjectCreator.sh'
        ./ProjectCreator.sh
elif [ $WantsProjectSetup = 'n' ] || [ $WantsProjectSetup = 'no' ]
then
        echo 'Ok. You can create anytime you want a Laravel project with the script ProjectCreator.sh inside this directory'
fi
