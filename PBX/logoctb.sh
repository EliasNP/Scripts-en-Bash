#!/bin/bash
#titulo         :logoctbell.sh
#descripcion    :Este Script muestra nuevo logo para los menus.
#autor	        :Elias Nieva Prieto
#fecha          :2019-16-08
#version        :0.1
#uso		:sh logoctbell.sh
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

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                              DEFINICION DE VARIABLES PROPIAS                      #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

FOLDERWEB="/var/www/html/"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`
USERID=`id -g`
NAME=`hostname -s`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
IPCHECK=www.google.es
grep -R "nameserver" /etc/resolv.conf | cut -d " " -f2 >/tmp/dns.txt
LINE1=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *2'| cut -d " " -f7`
LINE2=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *3'| cut -d " " -f7`
LINE3=`cat -n /etc/resolv.conf | cut -d "" -f1 | grep '^ *4'| cut -d " " -f7`
VERSION=`grep -R "#version" /root/scripts/estado.sh`
NUMVER=`echo $VERSION | cut -d ":" -f2` #Extrae Version en local 
OUTPUT="/tmp/input.txt"


#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                              DEFINICION DE FUNCIONES                      #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░


trap 'printf "\n";partial;exit 1' 2
banner() {
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓████████████████████████████████████████████\033[1;33m/etc/profile.d/logoctb.sh\033[1;34m ▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█ 					${Blanco}	$FECHA - $HORA${Azulclaro}     █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   ____        ______        ____              ___       ___        █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  /\  _ \     /\__  _\      /\  _  \          /\_ \     /\_ \       █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  \ \ \/\_\   \/_/\ \/      \ \ \L\ \     __  \//\ \    \//\ \      █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   \ \ \/_/_     \ \ \       \ \  _ <   / __ \  \ \ \     \ \ \     █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█    \ \ \L\ \ __  \ \ \  __   \ \ \L\ \/\  __/   \_\ \_    \_\ \_   █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█     \ \____//\_\  \ \_\/\_\   \ \____/\ \____\  /\____\   /\____\  █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█      \/___/ \/_/   \/_/\/_/    \/___/  \/____/  \/____/   \/____/  █▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█                                                  Tlf: ${Amarillo}966 812 131\033[1;34m  █▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█${Rojoclaro} http://www.ctbell.com\033[1;34m  █████████████████████████████████████ \e[0m\033[0;37m v.$NUMVER\033[1;34m█▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}

info() {
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   ${Rojoclaro} COMANDOS UTILES EN TODO MOMENTO PARA LLAMAR A LOS SCRIPTS:\033[1;34m      █▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Amarillo}En todo momento para abrir el menu de Ayuda de C.T.Bell slu       \033[1;34m█▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Blanco}\"estado\"                                                          \033[1;34m█▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Amarillo}Descarga los scripts actualizados  y los instala como comandos    \033[1;34m█▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Blanco}\"updatespt\"                                                       \033[1;34m█▓▓▓▓▒▒▒░░ \e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓███${Blanco}IP-1ra Interfaz \033[1;31m$IP ${Azulclaro}██${Blanco}IP-2da Interfaz \033[1;31m$IP2 ${Azulclaro}████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}

vncserv() {
printf "\033[1;34m ░░▒▒▒▓▓▓▓█   \"service vncserver restart \e[0m\": Para reiniciar el ENTORNO GRAFICO Y Conectar po███▓▓▓▓▒▒▒░░\e[0m\n"$
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓███${Blanco}IP-1ra Interfaz \033[1;31m$IP ${Azulclaro}██${Blanco}IP-2da Interfaz \033[1;3███▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Blanco}Usamos la IP del la 1ra Interfaz del equipo \033[1;31m$IP ${Blanco}y el puer$███▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  \033[1;31m$IP:5901\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█  ${Blanco}Usamos la IP del la 2da Interfaz del equipo \033[1;31m$IP2 ${Blanco}y el pue███▓▓▓▓▒▒▒░░\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓█     Ej: \033[1;31m$IP2:5901\e[0m\n"
printf "\033[1;34m ░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░\e[0m\n"
}


_opciones(){

    # Selecciona entre estado o Salir.
    printf "%s\n${Verdeclaro}%s\n%s\n${Amarillo}%s\n${nc}%s\n" "Deseas entrar el Menú de C.t.Bell" "1.Menú de Estados" "2.Salir a CLI" "3.Iniciar Configurador de red " "4.Nueva Instalación" 
    read -r option

    # 
    case $option in
        1) /root/scripts/estado.sh
            ;;
        2) exit
	    ;;
        3) system-config-network
            ;;
	4) echo -e "${Rojoclaro}/root/scripts/ninsta.sh ${nc}" & _opciones
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "No he entendido la seleccion." \
               "Presiona <Ctrl-c> para Salir."
           _opciones
            ;;
    esac

}

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                              TRABAJOS PREVIOS DE COMPROBACION                        #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

# COMPROBAMOS QUE FUNCIONAN LOS DNS
if [ "`ping -c 1 $IPCHECK`" ]; then   YDNS=CORRECTO; else   YDNS="FALLIDO"; fi
clear
# SI LAS DNS funcionan seguimos si no iniciamos el configurador de RED

#Mensaje de Comprobación

    dialog --begin 10 25 --backtitle "C.T.Bell s.l.u" \--title "Menú Configuración" \--msgbox '\nLa Prueba de DNS para '${NAME}'   ['${YDNS}']\n\nLAS DNS SON: \n   '${LINE1}' \n   '${LINE2}'\n   '${LINE3}'\n\nIP 1ra Interfaz\n  eth0:'${IP}' \nIP 2da Interfaz\n  eth1:'${IP2}'"' 18 45 ;

    # Preguntamos que hacer.
        dialog --title "Iniciar Asistente de Red" \
        --backtitle "C.T.Bell S.l.u" \
        --yesno "Quieres Iniciarl el Asistente de Red para modificar IP'S o DNS ?" 7 60

        # Get exit status
        # 0 means user hit [yes] button.
        # 1 means user hit [no] button.
        # 255 means user hit [Esc] key.
        response=$?
                case $response in
                   0) "system-config-network" ;;# "services network restart" ;;
                   1) clear;;
                   255) echo "[ESC] key pressed.";;
                esac

nohup ./updatespt.sh
clear #Limpiamos los trabajos previos para que no se muestren en Terminal
reset

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                                 INICIAMOS EL SCRIPT                             #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

# DEFINIMOS QUE EL USUARIO SEA ROOT PARA CONTINUAR

#Verificar root
if [ $USERID -eq 0 ]; then
        echo "$USERID"
else
        clear
        echo -e "\033[1;31m Para que todos los cabios funciones correctamente entre como \"root\" ${nc}"
        echo -e "\033[0;34m Use la sintaxis \033[1;31m'sudo sh menuscript.sh' \033[0;34mhe introduzca la clave"
        echo ""
exit
fi

#Limpiamos consola CLI
ln -f /root/scripts/logoctb.sh /etc/profile.d/logoctb.sh
clear

# Mostramos las funciones declaradas.
banner
info
#
# Pendiente crear el condicional con IF si detecta el servidor de vnc a falta de probar los problemas que genera 1ro
#vncserv
#
#_opciones 
