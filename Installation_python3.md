# INSTALLATION IN PYTHON 3

Compared to the ANSSI's project, some modifications need to be made in order to use polichombr in the most recent version of Python, version 3.

## PREREQUISITES:

Once you clone the git, please do the follow: 

- First, make sure you have python 3 on your machine.

- **IN REQUIREMENTS.TXT**:
  -	_DO NOT ADD_ default version to the librairies.
  -	ADD the _email_validator_ library that validates that a string is of the form name@example.com
  -	REMOVE _flask_cors, flask_login, itsdangerous, Jinja2, MarkupSafe, Werkzeug, WTForms_ because they are installed by default when flask is installed.
  
 - **MARSHMALLOW LIBRARY UPDATES:**
 
   In those files:
   - Polichombr/models/user.py
   - Polichombr/models/analysis.py
   - Polichombr/models/sample.py
   - Polichombr/models/idaactions.py
   - Polichombr/models/yara_rule.py
   - Polichombr/models/family.py

   Add this line for each file:
   ```
   from marshmallow import Schema
   ```
   And change for each file: 
   
   ```
   sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/user.py
   ```
           
- **WERKZEUG LIBRARY UPDATES:**

  Modify those files like under:
 
 ```
 sed -i 's/from werkzeug import secure_filename/from werkzeug.utils import secure_filename/g' polichombr/views/webui_families.py
 sed -i 's/from werkzeug import secure_filename/from werkzeug.utils import secure_filename/g' polichombr/views/webui_sample.py
 ```
 
- **INSTALL.SH:**

 Install the _wheel_ package & the _requirements.txt_ using _pip3_
 
 ```
 pip3 install wheel
 pip3 install -r requirements.txt
 ```
 
 Modify the conf.py file by adding your absolute path:
 
 ```
 sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////$ABSOLUTE_PATH/opt/data/app.db"' ./polichombr/config.py
 sed -i '/STORAGE_PATH/c\STORAGE_PATH = "$ABSOLUTE_PATH/opt/data/storage"' ./polichombr/config.py
 ```
 
 ## INSTALLATION

- STEP 1: Create your environment by creating the folders under
  
  ```
  mkdir FOLDER_NAME
  mkdir FOLDER_NAME/opt
  mkdir FOLDER_NAME/opt/data/storage
  ```

- STEP 2: Clone the git in FOLDER_NAME/opt
  ```
  git clone + [URL]
  ```

- STEP 3: Make sure you've done all the previous prerequisities

- STEP 4: Create your virtual environment & activate it 
  ```
  sudo apt-get install python3-venv
  cd FOLDER_NAME/opt/polichombr
  python3 -m venv flask
  . flask/bin/activate
  ```
  
- STEP 5: Run the install.sh file
  ```
  ./install.sh
  ```
  
- STEP 6: Run the run.py file
  ```
  ./run.py
  ```




