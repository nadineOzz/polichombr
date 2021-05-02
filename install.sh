#!/bin/bash

#Prerequisites, on a ubuntu* distribution.
#sudo apt-get install -y git virtualenv ruby libffi-dev python-dev graphviz gcc libssl-dev python-pip
git submodule init metasm # or clone github.com/jjyg/metasm
git submodule update metasm

#Create & activate the virtual environment
python3 -m venv flask
. flask/bin/activate

#Install packages
pip install -r requirements.txt 

#Modify the conf.py file
sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////home/kali/polichombr/opt/data/app.db"' ./polichombr/polichombr/config.py
sed -i '/STORAGE_PATH/c\STORAGE_PATH = "/home/kali/polichombr/opt/data/storage"' ./polichombr/polichombr/config.py

#mkdir /opt/data

mv /opt/polichombr/examples/db_create.py .
python db_create.py



