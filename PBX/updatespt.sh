#!/bin/bash
#titulo         :updatespt.sh
#descripcion    :Este Script actualiza los scripts para manejar opciones con las centralitas.
#autor	        :Elias Nieva Prieto
#fecha          :2019-06-14
#version        :0.5
#uso		    :sh updatespt.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                           INICIAMOS EL SCRIPT                             #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
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

FOLDERWEB="/var/www/html/"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
wget -P ~/scripts/ -N -i http://radius.ctbell.com/ctbell/actualiza.txt &&
chmod +x ~/scripts/*
# yum install dialog -y
mkdir /home/asterisk/audios
mkdir /home/asterisk/temporales
mkdir /home/asterisk/scripts
wget -P /home/asterisk/scripts/ -N -i http://84.232.5.8/ctbell/audio/actualiza.txt &&
chmod +x /home/asterisk/scripts/*
mv /etc/samba/smb.conf /etc/samba/smb_$FECHA.conf
cp /home/asterisk/scripts/smb.conf /etc/samba/smb.conf
mv /var/spool/cron/root /var/log/root_$FECHA.OLD
cp /root/scripts/crontab-may.txt /var/spool/cron/root
mv -f /etc/crontab /var/log/crontab_$FECHA.OLD
mv -f /etc/crontab_* /var/log/
mv -f /root/scripts/crontab.copia /etc/crontab
mv -f /var/spool/cron/root_* /var/log/
chmod 600 /var/spool/cron/root
chmod 644 /etc/crontab
service crond restart
ln -f /root/scripts/tmsg.sh /usr/bin/tmsg
ln -f /root/scripts/tmsge.sh /usr/bin/tmsge
ln -f /root/scripts/estado.sh /usr/bin/estado
#/root/scripts/tmsge.sh "ACTUALIZADO CON UPDATE SCRIPT - OK"
ln -f /root/scripts/updatespt.sh /usr/bin/updatespt
printf "# ░░▒▒▒▓▓▓▓███████████████$FECHA y $HORA███████████████████████████████████▓▓▓▓▒▒▒░░\n"
printf "#       /var/log/cron/root_$FECHA.OLD         /var/log/cron/crontab_$FECHA.OLD             /etc/samba/smb_$FECHA.conf         \n" 
printf "# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\n" 
printf "# ░░▒▒▒▓▓▓▓███████████████$FECHA y $HORA███████████████████████████████████▓▓▓▓▒▒▒░░\n" >> /root/scripts/registro_update.txt
printf "       /var/log/cron/root_$FECHA.OLD         /var/log/cron/crontab_$FECHA.OLD             /etc/samba/smb_$FECHA.conf         \n">> /root/scripts/registro_update.txt
printf "# ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\n" >> /root/scripts/registro_update.txt
printf "" >> /root/scripts/registro_update.txt