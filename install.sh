#!/bin/bash

#Install packages & metasm git
git submodule init metasm # or clone github.com/jjyg/metasm
git submodule update metasm


#Create virtual environment & activate it 
python3 -m venv flask
source flask/bin/activate

pip3 install wheel 
pip3 install -r requirements.txt

#Modify the conf.py file
sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////home/kali/poli/opt/data/app.db"' /home/kali/poli/polichombr/polichombr/config.py
sed -i '/STORAGE_PATH/c\STORAGE_PATH = "/home/kali/poli/opt/data/storage"' /home/kali/poli/polichombr/polichombr/config.py

mv /opt/polichombr/examples/db_create.py .
python3 db_create.py



