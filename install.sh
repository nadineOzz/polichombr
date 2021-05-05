#!/bin/bash

#Install packages & metasm git
git submodule init metasm # or clone github.com/jjyg/metasm
git submodule update metasm

#Install requirements
pip3 install wheel 
pip3 install -r requirements.txt

#Create an environment variable
install_path=$(cd .. && pwd)
#Modify the conf.py file
sed -i "/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = \"sqlite:////$install_path/data/app.db\"" ./polichombr/config.py
sed -i "/STORAGE_PATH/c\STORAGE_PATH =\"$install_path/data/storage\"" ./polichombr/config.py

cp ./examples/db_create.py .
python3 db_create.py



