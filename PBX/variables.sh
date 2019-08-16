#!/bin/bash
#titulo         :variables.sh
#descripcion    :Variables Genericas para todos los Scripts de C.T.Bell
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-27
#version        :0.4
#uso		    :sh variables.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#============================================================================
#           CSS PARA ENRRIQUECER TEXTO CON COLORES Y SALTOS DE LINEA        #
#============================================================================
trap 'printf "\n";partial;exit 1' 2
banner() {
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf ""
printf "\033[1;34m           ░░░▒▓▓▓▓▓▒▒▓▓▒░░░                                                                                                        13-06-2019\e[0m\n"
printf "\033[1;34m       ░░▒▓██▓▓▓▒▒▒▓▓▓▓▓▓▓██▓▒░░ \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m     ░▓██▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒░░▒░ \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m   ░▒▓█▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▒░░▒▓▓▓▓█▓░░  \e[0m\033[1;37m            ░░░░░      ░░░░░░░░░░░░░    ░░░░░░░░░░░     ░░░░░░░░░   ░░░        ░░░ \e[0m\n"
printf "\033[1;34m  ░▒██▓▓▓▓▒▒▓▓▓▓▓▒▒▒▒▒░░▒▓▓▓▓▓▓▓▓█▓▒░   \e[0m\033[1;37m       ░▓██████▓▒░  ██████████████░  ▒██████████▓▒░  ▓█████████▓ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m  ░▒▒▒▒▒▒░▒▓▒▒▒▒▒▒▒░░▒▒▒▒▒▒▓▓▓▓▓▓▒░░     \e[0m\033[1;37m    ▒▓███████████▓░██████████████░  ▒████████████░  ▓█████████▓ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m ░░░░░░░   ░░░░▒▒░░░▒▒▒▒▒▒▒▒▓▒▒░░░░▒▓░   \e[0m\033[1;37m   ░███▓░   ░▓████▒     ░███        ▒███▒░  ░▓███░  ▓██░        ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m ▓█▓▓▓▒▒▓▓▒▒▒▒░░  ░░▒▒▒▒▒▒▒░░░░▒▓▓▓▓█▓░   \e[0m\033[1;37m  ▓██░      ░░░░░░     ░███        ▒███▓▓▓▓▓▓███░  ▓███▓▓▓▓▓▓░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m ▒▓▓▒▒▒▓▓▒▒▒▒▒░░▒▒▒░░ ░░░░ ░▒▒▓▓▓▓▓▓▓▓░   \e[0m\033[1;37m ░███░                 ░███        ▒████████████▓░ ▓█████████░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m ▒▒▒░░░░░▒▒▒░░░▒▒▒▒▒▒░░  ░░▒▒▒▓▓▓▓▓▓▓█░   \e[0m\033[1;37m  ▓██░░     ░▒▓▓▓▒     ░███        ▒███▒░   ░▒███▒ ▓███░░░░░░░ ░▓██░       ▒██▒░ \e[0m\n"
printf "\033[1;34m ▓▓▓▒▓▓▓▓▒▒░░░░▒▒▒▒▒░░░░░░░░▒▒▓▓▓▓▓▓▓▓░    \e[0m\033[1;37m ░███▓░  ░░█████░     ░███        ▒███▒░   ░▒███▓ ▓███░░░░░░░░░▓██░░░░░░░ ▒██▒░░░░░░ \e[0m\n"
printf "\033[1;34m ▓█▒▓▓▓▓▓▓▒░▒▒░░░▒▒░░░░▒▒▒▒░░░▒▓▓▓▓▓█▓░  \e[0m\033[1;37m    ░▓███████████▒░     ░███        ▒█████████████░ ▓██████████░░▓████████▓ ▒█████████ \e[0m\n"
printf "\033[1;34m ░▒▒▓▓▓▓▓▒░▒▒▒▒▒▒░░ ░▒▒▒▒▒▒▒▒░ ░▓▓▓▓█░  \e[0m\033[1;37m       ░▓██████▓▒░       ░███        ▒██████████▓▒░  ▓██████████░░▓████████▓ ▒█████████ \e[0m\n"
printf "\033[1;34m ░▒▒▒▒▒▓▓▒░▓▒▒▒▒▒░░░░░▒▒▒▒▒▓▓▒░ ░▓▓█▓░    \e[0m\033[1;37m  \e[0m\n"
printf "\033[1;34m   ▒██▓▓▒░▒▓▓▓▓▒░░░▒▒▒░░▒▓▓▓▓▓▓▒░░▓▒░                                             Tlf: ${Marron}966 812 131 \e[0m\n"
printf "\033[1;34m   ░▒▓█▓░░▓▒▒▒▓▒░░▒▓▓▓▓▒░▒▓▓▓▓▓▓▒░                                            http://www.ctbell.com                      ${Cyanclaro}v.2019.v6308.30${nc}\e[0m\n"
printf "\033[1;34m     ░░▓░░▓▓▓▓▒░░▓▓▓▓▓▓▓▓░░▓▓██▓░░        \e[0m\n"
printf "\033[1;34m       ░░░▓██▓▒ ░▓▓▓▓▓▓▓▓▓▒░▓▒▒░           \e[0m\n"
printf "\033[1;34m        ░░░▓█▓ ░▓▓▓▓▓▓▓▒░▓▒▒░ \e[0m\n"
printf "\033[1;34m           ░░▓█▓ ░▓▓▓▒░▓▒▒░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}


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

VER=V.5-31.1312

# Nombre que va delante del numero de Extensión Ej. CTBELL-100
INDICE="HABITACIONES"

# Extension de Inicio para el Contador.
HABSTART=100

# Extension Limite para el contador.
LIMIT=999

# Habitación por defecto para la cabina
ROMCAB="700"
# Nombre que aparecera en la extension de la Cabina
CABINA="$ROMCAB-CABINA"

# Fichero de salida donde el Driver del "CHAR" cargara los nombres en los CheckIn-Out
SALIDA=/opt/CHAR/checking/salida.txt

# Password para la compresion de Audios de llamadas
PASSWORD="icaroctbell"

# Ruta de los Ficheros de Actualizacion de los scripts.
FOLDER1="scripts"
CARPETA="/root/$FOLDER1/"
URL=radius.ctbell.com/ctbell/
ROOTSCRIPT=rootscripts.tar.gz
URL1=http://$URL$ROOTSCRIPT

#-------------------------------------------------------------------------------------------------------------------
################A PARTIR DE AQUÍ HACIA ABAJO EMPEZARAN LAS HABITACIONES CON SUS NOMBRES
#-------------------------------------------------------------------------------------------------------------------
#
# HABITACIONES
#~~~~~~~~~~~~~~~
#HAB#--#NOMBRE#
HAB9="_-9"
HAB100="_-100"
HAB102="_-102"
HAB103="_-103"
HAB104="_-104"
HAB105="_-105"
HAB106="_-106"
HAB107="_-107"
HAB108="_-108"
HAB109="_-109"
HAB121="_-121"
HAB150="_-150"
HAB151="_-151"
HAB170="_-170"
HAB171="_-171"
HAB201="_-201"
HAB101="_-101"
HAB110="_-110"
HAB111="_-111"
HAB112="_-112"
HAB113="_-113"
HAB114="_-114"
HAB115="_-115"
HAB116="_-116"
HAB117="_-117"
HAB118="_-118"
HAB119="_-119"
HAB120="_-120"
HAB700="CABINA"
