#!/bin/bash

cd routes/

sudo wget http://raw.githubusercontent.com/ASL17/laravel/master/RandomPasswordPage/web.php

sudo rm web.php
sudo mv web.php.1 web.php

cd ../resources/views/

#remove possibly old-version of a previous page
if [ -e generatore_passwd.blade.php ]
then
        sudo rm generatore_passwd.blade.php
fi

sudo wget https://raw.githubusercontent.com/ASL17/laravel/master/RandomPasswordPage/generatore_passwd.blade.php



