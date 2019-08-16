#!/bin/bash -
#Titulo         :instaudio.sh
#Descripción   :Actualiza y/o Instala lo necesarios para grabar llamadas y encriptarlas
#Autor          :Elías Nieva Prieto
#Fecha          :2019-06-13
#Versión       :0.1
#uso            :./instaudio.sh
#Notas          :
#bash_version   :4.4.19(1)-release
#E-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                                TRABAJOS PREVIOS DE COMPROBACION                        #
# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh
source $VARIABLE

trap 'printf "\n";partial;exit 1' 2
banner() {
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[0;30m ░░▒▒▒▓▓▓▓███\033[0;30m3ln1pr1@\033[0;30mkeemail.me\033[0;30m████████████████████████████████████████████████████████████████████████████████████████\033[1;33m/etc/profile.d/logoctb.sh\033[0;30m██▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m \e[0m\n"
printf "\033[1;34m                  ░░░▒▓▓▓▓▓▒▒▓▓▒░░░                                                                                                        13-06-2019\e[0m\n"
printf "\033[1;34m              ░░▒▓██▓▓▓▒▒▒▓▓▓▓▓▓▓██▓▒░░ \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m            ░▓██▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒░ \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m          ░▒▓█▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓▓▓█▓░░  \e[0m\033[1;37m            ░░░░░      ░░░░░░░░░░░░░   ░░░░░░░░░     ░░░░░░░░░   ░░░        ░░░ \e[0m\n"
printf "\033[1;34m         ░▒██▓▓▓▓▒▒▓▓▓▓▓▒▒▒▒▒░░▒▓▓▓▓▓▓▓▓█▓▒░   \e[0m\033[1;37m       ░▓██████▓▒░  ██████████████░ ▒████████▓▒░  ▓█████████▓ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m         ░▒▒▒▒▒▒░▒▓▒▒▒▒▒▒▒░░▒▒▒▒▒▒▓▓▓▓▓▓▒░░     \e[0m\033[1;37m    ▒▓███████████▓░██████████████░ ▒██████████░  ▓█████████▓ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m        ░░░░░░░   ░░░░▒▒░░░▒▒▒▒▒▒▒▒▓▒▒░░░░▒▓░   \e[0m\033[1;37m   ░███▓░   ░▓████▒     ░███       ▒██▒░  ░▓██░  ▓██░        ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m        ▓█▓▓▓▒▒▓▓▒▒▒▒░░  ░░▒▒▒▒▒▒▒░░░░▒▓▓▓▓█▓░   \e[0m\033[1;37m  ▓██░      ░░░░░░     ░███       ▒██▓▓▓▓▓▓██░  ▓███▓▓▓▓▓▓░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m        ▒▓▓▒▒▒▓▓▒▒▒▒▒░░▒▒▒░░ ░░░░ ░▒▒▓▓▓▓▓▓▓▓░   \e[0m\033[1;37m ░███░                 ░███       ▒██████████▓░ ▓█████████░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m        ▒▒▒░░░░░▒▒▒░░░▒▒▒▒▒▒░░  ░░▒▒▒▓▓▓▓▓▓▓█░   \e[0m\033[1;37m  ▓██░░     ░▒▓▓▓▒     ░███       ▒██▒░   ░▒██▒ ▓███░░░░░░░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m        ▓▓▓▒▓▓▓▓▒▒░░░░▒▒▒▒▒░░░░░░░░▒▒▓▓▓▓▓▓▓▓░    \e[0m\033[1;37m ░███▓░  ░░█████░     ░███       ▒██▒░   ░▒██▓ ▓███░░░░░░░░░▓██░░░░░░░ ▒██▒░░░░░░ \e[0m\n"
printf "\033[1;34m        ▓█▒▓▓▓▓▓▓▒░▒▒░░░▒▒░░░░▒▒▒▒░░░▒▓▓▓▓▓█▓░  \e[0m\033[1;37m    ░▓███████████▒░     ░███       ▒███████████░ ▓██████████░░▓████████▓ ▒█████████ \e[0m\n"
printf "\033[1;34m        ░▒▒▓▓▓▓▓▒░▒▒▒▒▒▒░░ ░▒▒▒▒▒▒▒▒░ ░▓▓▓▓█░  \e[0m\033[1;37m       ░▓██████▓▒░       ░███       ▒████████▓▒░  ▓██████████░░▓████████▓ ▒█████████ \e[0m\n"
printf "\033[1;34m        ░▒▒▒▒▒▓▓▒░▓▒▒▒▒▒░░░░░▒▒▒▒▒▓▓▒░ ░▓▓█▓░    \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m          ▒██▓▓▒░▒▓▓▓▓▒░░░▒▒▒░░▒▓▓▓▓▓▓▒░░▓▒░                                             Tlf: \e[0m\033[0;37m966 812 131 \e[0m\n"
printf "\033[1;34m          ░▒▓█▓░░▓▒▒▒▓▒░░▒▓▓▓▓▒░▒▓▓▓▓▓▓▒░                                            http://www.ctbell.com                      \e[0m\033[0;37mv.2019.v6.1313.30${nc}\e[0m\n"
printf "\033[1;34m            ░░▓░░▓▓▓▓▒░░▓▓▓▓▓▓▓▓░░▓▓██▓░░        \e[0m\n"
printf "\033[1;34m              ░░░▓██▓▒ ░▓▓▓▓▓▓▓▓▓▒░▓▒▒░           \e[0m\n"
printf "\033[1;34m               ░░░▓█▓ ░▓▓▓▓▓▓▓▒░▓▒▒░ \e[0m\n"
printf "\033[1;34m                  ░░▓█▓ ░▓▓▓▒░▓▒▒░ \e[0m\n"
printf "\033[1;34m \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}


# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                        DEFINICION DE VARIABLES PROPIAS                      #
# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

:<<-!  ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh
Amarillo Azul Azulclaro Blanco Cyan Cyanclaro FOLDER1 Grisclaro Grisoscuro Marron nc Negro Purpura Purpuraclaro Rojo Rojoclaro ROOTSCRIPT URL URL1 VAR VAR1 VAR2 Verde Verdeclaro
-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                             INICIAMOS EL SCRIPT                             #
# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

banner
printf "\033[1;34m Vamos a proceder a Instalar todo lo necesario para poder grabar, Recuperar y encriptar las llamadas\e[0m\n"
printf "\033[1;32m ¿Quieres instalar el programa?\e[0m\n"
while true; do
    read -p "S/s ó N/n :>>" yn
    case $yn in
        [Ss]* ) sleep 1 ; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor, elige 'S/s' o 'N/n'.";;
    esac
done
printf "\033[1;33mOk le has dado que SI\e[0m\n"
sudo rpm -Uvh http://mirrors.kernel.org/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
sudo sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
sudo yum install -y p7zip p7zip-plugins

mkdir /home/asterisk/audios
mkdir /home/asterisk/temporales
mkdir /home/asterisk/scripts


wget -P /home/asterisk/scripts/ -N -i http://84.232.5.8/ctbell/audio/actualiza.txt &&
chmod +x /home/asterisk/scripts/*


mv /etc/samba/smb.conf /etc/samba/smb.conf_OLD
cp /home/asterisk/scripts/smb.conf /etc/samba/smb.conf


mv /var/spool/cron/root /var/spool/cron/root_$FECHA.OLD
cp /root/scripts/crontab-may.txt /var/spool/cron/root


mv /etc/crontab /etc/crontab_$FECHA.OLD
cp /root/scripts/crontab.copia /etc/crontab






# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                             FIN DEL SCRIPT                             #
# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
