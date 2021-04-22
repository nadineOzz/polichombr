FROM python:3.9

#Get yourself into the /opt/ directory
WORKDIR /opt/

#Updates
RUN apt-get update
RUN apt-get upgrade -qq
RUN apt-get dist-upgrade -qq

#Install packages
RUN apt-get install -qqy git virtualenv ruby libffi-dev python-dev graphviz gcc libssl-dev

#In the /opt/ directory, clone the git
RUN git clone https://github.com/nadine2497/polichombr.git 

#Dans /opt/polichombr
WORKDIR /opt/polichombr/

#Execute the install.sh file 
RUN ./install.sh

