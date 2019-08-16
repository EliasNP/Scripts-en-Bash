#!/bin/bash

# Bash css!
red="\033[1;31m"
blue="\033[0;36m"
nc="\033[0m"

        # DEFINICION DE VARIABLES #
#==========================================
CREADOR="ELIAS NIEVA"
E_MAIL="informatica@ctbell.com"
EMPRESA="C.T.Bell s.l.u"
TELEFONO="966 812 131"
FOLDERWEB="/var/www/html/"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
#==========================================

        # INICIO DEL SCRIPT #
#==========================================
TOKEN="828953966:AAHB2SNn8f8gX0cZgmiBo4SJCXUs-DS7wCY"
ID="-1001451740611"
MENSAJE=$1
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

echo -e "${red}Introduce el mensaje que quieres enviar${blue}"
read MENSAJE

curl -s -X POST $URL -d chat_id=$ID -d text="$(curl ifconfig.co)-[$(hostname)]-IP PBX:[$(hostname -I)]:  {}$MENSAJE"
echo ""
echo -e "${red}MENSAJE EVIADO:\n${nc}$MENSAJE"


