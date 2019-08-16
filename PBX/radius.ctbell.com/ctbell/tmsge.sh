#!/bin/bash
#titulo         :tmsg.sh
#descripcion    :Este Script  Envia mensaje por Telegram al Bot de CTBELL
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-31
#version        :0.5-31
#uso		    :./tmsg.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                     INICIAMOS ESTADO DE VARIABLES                         #
#============================================================================

# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
source $VARIABLE
ARCHIVO=tmsg
VER=v-7.22.1337
# Ruta de los Ficheros de Actualizacion de los scripts.
FOLDER1="scripts"
CARPETA="/root/$FOLDER1"
URL=radius.ctbell.com/ctbell

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

nohup wget -N -P $CARPETA/ -i http://$URL/actualiza.txt &
chmod +x $CARPETA/*
ln -f $CARPETA/$ARCHIVO.sh /usr/bin/$ARCHIVO

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

TOKEN="828953966:AAHB2SNn8f8gX0cZgmiBo4SJCXUs-DS7wCY"
ID="237143156" #Elias
#ID="-1001451740611" #Grupo CTBELL
MENSAJE=$1
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="[$(hostname)]-[$(curl ifconfig.co)]/ $VER / IP PBX:[$(hostname -I)]: { $MENSAJE }"
sleep 1
