#!/bin/bash
APPNAME="appname"
WWWDIR="/var/www/"

INSTALLDIR=${WWWDIR}${APPNAME}

#virtualenv
sudo apt-get install python-pip 
sudo pip install virtualenv
virtualenv venv
venv/bin/pip2.7 install flask
venv/bin/pip2.7 install flask_sqlalchemy

mkdir ${APPNAME}
mv venv ${APPNAME}
cp -R flask_app ${APPNAME}
cp application.wsgi ${APPNAME}
sudo mv ${APPNAME} ${WWWDIR}

# apache setup
sudo apt-get install -y python-dev apache2 libapache2-mod-wsgi
sudo a2enmod wsgi
sudo cp apache2.conf /etc/apache2/sites-available/${APPNAME}.conf
sudo a2ensite ${APPNAME}
sudo service apache2 stop
sudo service apache2 start
