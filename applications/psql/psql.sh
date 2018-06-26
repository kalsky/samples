#!/bin/bash

# For Debugging (print env. variables, define command tracing)
# set -o xtrace
# env
# set

###############################################
# To use:
# https://raw.github.com/gist/2776351/???
# chmod 777 install_postgresql.sh
# ./install_postgresql.sh
###############################################
#echo "*****************************************"
#echo " Installing PostgreSQL"
#echo "*****************************************"
#sudo yum update
#sudo yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
#sudo service postgresql initdb
# Use MD5 Authentication
#sudo sed -i.bak -e 's/ident$/md5/' -e 's/peer$/md5/' /var/lib/pgsql9/data/pg_hba.conf
#start
#sudo /sbin/chkconfig --levels 235 postgresql on
#sudo service postgresql start

sudo apt update
sudo apt install postgresql postgresql-contrib -y

#sudo su postgres
sudo -u postgres createuser -s $(whoami); createdb $(whoami)
psql

ALTER USER postgres WITH PASSWORD '$DB_PASS';
CREATE DATABASE $DB_NAME;
\q
