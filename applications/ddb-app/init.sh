#!/bin/bash
sudo mkdir /var/www
sudo mkdir /var/www/ddb
git clone https://github.com/kalsky/django-dashboard-black --depth 1 --branch=master /var/www/ddb
cd /var/www/ddb
virtualenv env
source env/bin/activate
pip3 install -r requirements
python manage.py makemigrations
python manage.py migrate
