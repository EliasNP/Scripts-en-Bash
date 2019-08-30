#!/bin/bash
#titulo         :funciones.sh
#descripcion    :Este Script define funciones para poder usar en varios script sin tener que definirlos indivudualment en cada scritp.
#autor          :Elias Nieva Prieto
#fecha          :2019-08-20
#version        :0.1
#uso            :sh funciones.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono	:966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1=====$


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
#	LLAMAMOS A LAS VARIABLES  PROPIAS DEL CLIENTE                            #
#█████████████████████████████████████████████████████████$

# Variables Genericas y Funciones
#source /root/scripts/variables.sh


#█████████████████████████████████████████████████████████$
#        DEFINICION DE VARIABLES GENERICAS FIJAS                       #
#█████████████████████████████████████████████████████████$

FOLDERWEB="/var/www/html/"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
IPCHECK=www.google.es
grep -R "nameserver" /etc/resolv.conf | cut -d " " -f2 >/tmp/dns.txt
LINE1=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *2'| cut -d " " -f7`
LINE2=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *3'| cut -d " " -f7`
LINE3=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *4'| cut -d " " -f7`
#VERSION=`grep -R "#version" /root/scripts/estado.sh`
NUMVER=`echo $VERSION | cut -d ":" -f2` #Extrae Version en local
FOLDER1="scripts"
ROOTSCRIPT=actualiza.txt
URL=radius.ctbell.com/ctbell/
URL1=http://$URL$ROOTSCRIPT


#█████████████████████████████████████████████████████████
#                INICIAMOS LAS FUNCIONES
#█████████████████████████████████████████████████████████$
#
#           TRABAJOS PREVIOS DE COMPROBACION                        #
#
_actualiza()
{
nohup ./updatespt.sh
clear #Limpiamos los trabajos previos para que no se muestren en Terminal
echo "#NUMVER"
sleep 2
reset
}

# 
#	PRIMERA BANNER CON LOGO
#
trap 'printf "\n";partial;exit 1' 2
banner_CTBELL() 
{
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████\033[1;33m/etc/profile.d/logoctb.sh\033[1;34m ▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█                                            ${Blanco}   $FECHA - $HORA${Azulclaro}   █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   ____        ______        ____              ___       ___        █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  /\  _ \     /\__  _\	 /\  _  \          /\_ \     /\_ \	 █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  \ \ \/\_\   \/_/\ \/	 \ \ \L\ \     __  \//\ \    \//\ \	 █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   \ \ \/_/_     \ \ \	  \ \  _ <   / __ \  \ \ \     \ \ \     █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█    \ \ \L\ \ __  \ \ \  __   \ \ \L\ \/\  __/   \_\ \_    \_\ \_   █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█     \ \____//\_\  \ \_\/\_\   \ \____/\ \____\  /\____\   /\____\  █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█	   \/___/ \/_/   \/_/\/_/    \/___/  \/____/  \/____/   \/____/  █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█                                                  Tlf: ${Amarillo}966 812 131\033[1;34m  █▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█${Rojoclaro} http://www.ctbell.com\033[1;34m  ████████████████████████████████ \e[0m\033[0;37m v.$NUMVER\033[1;34m█▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}

#
#	FIN DE LA PRIMERA FUNCION "BANNER"
#
#█████████████████████████████████████████████████████████$
#
#	PRIMERA BANNER CON VARIABLES FIJAS
#
banner_Variables() 
{
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█████████████ IMPORTANTE LA PRIMERA VEZ Y ANTE LOS FALLOS ████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█                                                                    █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█ ${Amarillo} 1º SON CORRECTAS DE LAS HABITACIONES?:${Azulclaro}                            █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█         DESDE:${Rojoclaro}$HABSTART${Azulclaro}                                                  █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█         HASTA:${Rojoclaro}$LIMIT           ${Azulclaro}                                       █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█         CABINA:${Rojoclaro}$CABINA ${Azulclaro}                                         █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█ ${Amarillo} 2º RECUERDA${nc}:Nombrar todas las Extensiones:${Azulclaro}                        █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█ \"${Rojoclaro}OP.6 - ${nc}\" la primera vez ${Azulclaro}                                          █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█                                                                    █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
#printf "\033[1;34m ░░▒▒▒▓▓▓▓█ ${Rojo} IMPORTANTE: ${nc} Para Reiniciar el Entorno grafico si hay fallo usar '${Cyan}service vncserver restart${nc}'\n desde la linea de comandos\e[0m\n"
#printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}
#
#	FIN DE LA FUNCION "BANNER DE VARIABLES"
#

#banner_Variables
