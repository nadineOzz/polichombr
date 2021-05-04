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
sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////home/kali/poli/opt/data/app.db"' ./polichombr/config.py
sed -i '/STORAGE_PATH/c\STORAGE_PATH = "/home/kali/poli/opt/data/storage"' ./polichombr/config.py

#Marshmallow library updates
sed -i '11ifrom marshmallow import Schema' polichombr/models/user.py polichombr/models/analysis.py polichombr/models/sample.py polichombr/models/idaactions.py polichombr/models/yara_rule.py polichombr/models/family.py 
sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/user.py polichombr/models/analysis.py polichombr/models/sample.py polichombr/models/idaactions.py polichombr/models/yara_rule.py polichombr/models/family.py

#Werkzeug library updates
sed -i 's/from werkzeug import mkdir /opt/datasecure_filename/from werkzeug.utils import secure_filename/g' polichombr/views/webui_families.py polichombr/views/webui_sample.py

mv /opt/polichombr/examples/db_create.py .
python3 db_create.py



