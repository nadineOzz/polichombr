# INSTALLATION IN PYTHON 3

Compared to the ANSSI's project, some modifications need to be made in order to use polichombr in the most recent version of Python, version 3.
  
## INSTALLATION
 
 First, make sure you have installed python3 on your machine.

- **STEP 1: Create your environment by creating the folders under**
  
  ```
  mkdir FOLDER_NAME
  mkdir FOLDER_NAME/opt
  mkdir FOLDER_NAME/opt/data/storage
  ```

- **STEP 2: Clone the git in FOLDER_NAME/opt**
  ```
  git clone + [URL]
  ```

- **STEP 3: Modify the install.sh file by adding:**
   
  **1. Create the virtual environment**
  ```
   sudo apt-get install python3-venv
   python3 -m venv flask
  ```
  
  **2. Install packages**
  ```
   pip3 install wheel
   pip3 install -r requirements.txt
   ```
   
  **3. Modify the conf.py file**
  ```
  sed -i '/SQLALCHEMY_DATABASE_URI/c\SQLALCHEMY_DATABASE_URI = "sqlite:////$ABSOLUTE_PATH/opt/data/app.db"' ./polichombr/config.py
  sed -i '/STORAGE_PATH/c\STORAGE_PATH = "$ABSOLUTE_PATH/opt/data/storage"' ./polichombr/config.py
  ```
  
  **4. Marshmallow library updates**
  
   **a. Add in all the files "from marshmallow import Schema" at line 11**
   ```
  sed '11ifrom marshmallow import Schema' polichombr/models/user.py 
  sed '11ifrom marshmallow import Schema' polichombr/models/analysis.py 
  sed '11ifrom marshmallow import Schema' polichombr/models/sample.py 
  sed '11ifrom marshmallow import Schema' polichombr/models/idaactions.py 
  sed '11ifrom marshmallow import Schema' polichombr/models/yara_rule.py 
  sed '11ifrom marshmallow import Schema' polichombr/models/family.py 
  ```
   **b. Modify all the 'ma.ModelSchema' to 'Schema'**
   ```
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/user.py
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/analysis.py
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/sample.py
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/idaactions.py
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/yara_rule.py
  sed -i 's/ma.ModelSchema/Schema/g' polichombr/models/family.py
  ```
  
  **5. Werkzeug library updates**
   ```
   sed -i 's/from werkzeug import secure_filename/from werkzeug.utils import secure_filename/g' polichombr/views/webui_families.py
   sed -i 's/from werkzeug import secure_filename/from werkzeug.utils import secure_filename/g' polichombr/views/webui_sample.py
   ```
   
  **6. Copy & run db_create.py in the current directory**
  ```
   cp ./examples/db_create.py .  
   python3 db_create.py
   ```

- **STEP 4: Modify the requirements.txt file**
   ```
   _DO NOT ADD_ default version to the librairies.
   ADD the _email_validator_ library that validates that a string is of the form name@example.com
   REMOVE _flask_cors, flask_login, itsdangerous, Jinja2, MarkupSafe, Werkzeug, WTForms_ because they are installed by default when flask is installed.
  ```

- **STEP 5: Run the install.sh file**
  ```
  ./install.sh
  ```

- **STEP 6: Activate the virtual environment**
  ```
  . flask/bin/activate
  ```
  
- **STEP 7: Run the run.py file**
  ```
  ./run.py
  ```


