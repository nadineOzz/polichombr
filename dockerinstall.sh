
#!/bin/bash

#Prerequisites, on a ubuntu* distribution.
#sudo apt-get install -y git virtualenv ruby libffi-dev python-dev graphviz gcc libssl-dev python-pip
git submodule init metasm # or clone github.com/jjyg/metasm
git submodule update metasm

#Create & activate the virtual environment
python3 -m venv flask
. flask/bin/activate

#Install packages
pip3 install wheel
pip3 install -r requirements.txt

#Create an environment variable
sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////opt/data/app.db"' polichombr/config.py
sed -i '/STORAGE_PATH/c\STORAGE_PATH = "/opt/data/storage"' polichombr/config.py

cp ./examples/db_create.py .
python3 db_create.py

#installd.sh
#. flask/bin/activate
#./run.py
