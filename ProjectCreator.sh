#script for automatic laravel project installation and setup
#!/bin/bash


echo "Type the project name: followed by [ENTER]"
read ProjectName
sudo ./../../var/www/html/vendor/bin/laravel new $ProjectName
sudo mv $ProjectName ../../var/www/html/vendor

sudo chmod 777 ../../var/www/html/vendor/$ProjectName/resources/views
sudo chmod 777 ../../var/www/html/vendor/$ProjectName/storage/logs
sudo chmod 777 ../../var/www/html/vendor/$ProjectName/storage/framework/views
sudo chmod 777 ../../var/www/html/vendor/$ProjectName/storage/framework/sessions

cd ../../etc/apache2/sites-available/
sudo touch temp.conf
sudo chmod 777 temp.conf
sudo chmod 777 000-default.conf

sudo sed 's%DocumentRoot /var/www/html%DocumentRoot /var/www/html/vendor/'$ProjectName'/public%g'  000-default.conf > temp.conf

#rimuovo il file originale, e poi con mv cambio il nome del file
sudo rm 000-default.conf
sudo mv temp.conf 000-default.conf

cd ../../var/www/html/vendor/$ProjectName/
sudo wget http://raw.githubusercontent.com/ASL17/laravel/master/RandomPasswordPage/RandomPasswordPageSetup.sh
sudo chmod +x RandomPasswordPageSetup.sh

sudo service apache2 restart

