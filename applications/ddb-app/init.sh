#!/bin/bash
sudo apt-get update
sudo apt-get -y install python3-pip
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv
sudo mkdir /var/www
sudo mkdir /var/www/ddb
git clone https://github.com/kalsky/django-dashboard-black --depth 1 --branch=master /var/www/ddb
cd /var/www/ddb
virtualenv env
source env/bin/activate
pip3 install -r requirements
python3 manage.py makemigrations
python3 manage.py migrate
