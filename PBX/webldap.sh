# webldap.sh
#!/bin/bash
# ESTE SCRIPT DESCARGA LAS ULTIMAS VERISONES DE Las WEB PARA LDAP
#

echo Crea / Actualiza Web LDAP Admin
sleep 2
                        mkdir /var/www/html/agenda
sleep 2
                        mkdir /var/www/html/agenda/BackUp
sleep 2
                        cd /var/www/html/agenda/
sleep 2
                        wget http://84.232.5.8/agenda/agenda.tar.gz
sleep 2
                        tar -xzvf /var/www/html/agenda/agenda.tar.gz
sleep 2
                        rm -f /var/www/html/agenda/agenda.tar.gz
sleep 2

