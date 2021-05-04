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
sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////opt/data/app.db"' /polichombr/config.py
sed -i '/STORAGE_PATH/c\STORAGE_PATH = "/opt/data/storage"' /polichombr/config.py

mv /opt/polichombr/examples/db_create.py .
python3 db_create.py



