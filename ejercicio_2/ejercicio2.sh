#!/bin/bash

#░░▒▒▒▓▓▓▓███████████████████████████████████████████████████████████████████████████████████████████████████████████$
#				CSS PARA ENRRIQUECER TEXTO CON COLORES Y SALTOS DE LINEA			
#░░▒▒▒▓▓▓▓███████████████████████████████████████████████████████████████████████████████████████████████████████████$

# Bash css!
Negro="\033[0;30m"
Grisoscuro="\033[1;30m"
Azul="\033[0;34m"
Azulclaro="\033[1;34m"
Verde="\033[0;32m"
Verdeclaro="\033[1;32m"
Cyan="\033[0;36m"
Cyanclaro="\033[1;36m"
Rojo="\033[0;31m"
Rojoclaro="\033[1;31m"
Purpura="\033[0;35m"
Purpuraclaro="\033[1;35m"
Marron="\033[0;33m"
Amarillo="\033[1;33m"
Grisclaro="\033[0;37m"
Blanco="\033[1;37m"
nc="\033[0m"


#█████████████████████████████████████████████████████████$
#        DEFINICION DE VARIABLES GENERICAS FIJAS                       #
#█████████████████████████████████████████████████████████$

FECHA=`date +%Y-%m-%d`
 echo $FECHA
echo -e "Muestra la fecha de hoy"

HORA=`date +%H:%M`
 echo $HORA
echo -e "Muestra la hora actual"

USERID=`id -g`
 echo $USERID
echo -e "Muestra el Usuario"

IP=`hostname -I  | cut -d " " -f1`
 echo $IP
echo -e "Muestra la IP"

VERSION_SISTEMA=$(cat /etc/os-release | grep VERSION= | sed -n '1p' | sed 's/VERSION=//' | sed 's/"//g')
 echo $VERSION_SISTEMA
echo -e " Versión del Sistema Operativo"

NOM_DISTRO_C=$(cat /etc/os-release | grep NAME | grep -v "VERSION" | sed -n '2p' | cut -f2 -d\" | awk '{print $1}')
NOM_DISTRO_C=$(lsb_release -d | sed 's/Description://' | awk '{print $1}')
NOM_DISTRO_C=$(cat /etc/os-release | grep NAME | grep -v "VERSION" | sed -n '2p' | cut -f2 -d\")
 echo $NOM_DISTRO_C
echo -e " Almacena el nombre corto de la Distro detectada."

VERSION_BASH=$(bash --version | grep bash | awk '{print $4}') 
 echo $VERSION_BASH
echo -e " Almacenar la Versión del Bash Shell."

NOMBRE_USUARIO=$(cat /etc/passwd | grep $USERID | cut -d: -f1)
  echo $NOMBRE_USUARIO
echo -e " Nombre de Usuario creado por UID/GID (EJM. 1000) - VERSION SIMPLE"
