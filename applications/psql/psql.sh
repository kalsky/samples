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

sudo -u postgres createuser -s $(whoami); createdb $(whoami)
sudo -u postgres -c "ALTER USER postgres WITH PASSWORD '$DB_PASS';"

#Use MD5 Authentication
sudo sed -i.bak -e 's/ident$/md5/' -e 's/peer$/md5/' /etc/postgresql/9.5/main/pg_hba.conf
sudo service postgresql restart

#sudo su postgres
sudo PGPASSWORD=$DB_PASS psql -U postgres -c "CREATE DATABASE $DB_NAME";

sudo PGPASSWORD=$DB_PASS psql -U postgres -d $DB_NAME -c "CREATE TABLE tickets(id serial primary key,author VARCHAR(15),subject VARCHAR(50),issue VARCHAR(255),chatUrl VARCHAR(255),createdAt VARCHAR(100),archive BOOLEAN,status BOOLEAN)"
