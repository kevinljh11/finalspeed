# tools
sudo apt-get install lsof -y


# =====================================================================
# 1.nginx
sudo apt-get install nginx -y

# nginx start
# sudo /etc/init.d/nginx start 
# sudo service nginx start

# nginx show 
# dpkg -S nginx 

# nginx see which conf used
# nginx -t


# reference
# https://blog.csdn.net/STFPHP/article/details/53492723

# =====================================================================

# 2 php

# uninstall old php related files
# sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`\
# install add-apt-repository 
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
# maybe need to fix 
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
# see https://blog.csdn.net/think_ycx/article/details/84198255
sudo apt-get update -y

sudo apt-get install php5.6 -y 
# optional php modules
# sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
# sudo php -v


# references
# Installing PHP 5.6 on Xenial (16.04) [duplicate] https://askubuntu.com/questions/756181/installing-php-5-6-on-xenial-16-04


# =====================================================================
# 3. mysql 
# mysql install
sudo apt-get install mysql-server
sudo apt install mysql-client
sudo apt install libmysqlclient-dev #Connector/C (libmysqlclient) is a client library for C development.

# mysql start
# service mysql start

# mysql see if is running
# netstat -tap | grep mysql



# =====================================================================
# 4. nginx-php 

# php-fpm
apt-get install php5.6-fpm 
sudo service php-fpm start

# check status
# $ netstat -ano |grep fpm
# unix  2      [ ACC ]     STREAM     LISTENING     186389   /run/php/php5.6-fpm.sock

# php-fpm change nginx conf
# change  file in /etc/nginx/sites-enabled/default
# add php5.6 
: '
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        # location ~ \.php$ {
        #       include snippets/fastcgi-php.conf;
        #
        #       # With php7.0-cgi alone:
        #       fastcgi_pass 127.0.0.1:9000;
        #       # With php7.0-fpm:
        #       fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        # }

        # php 5.6 20181118 by thinkycx
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php5.6-fpm.sock;
        }
'

# test
# echo "<?php\n phpinfo(); " > /var/www/html/1.php
# curl http://localhost/1.php

# reference
# 1. https://blog.csdn.net/dengjiexian123/article/details/53358452


