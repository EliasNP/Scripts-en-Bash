#!/bin/bash
#titulo         :generabulk.sh
#descripcion    :# ESTE SCRIPT GENERA EL ARCHIVO BULK NUEVO PARA LAS CENTRALITAS Y TODOS LOS ARCHIVOS NECESARIOS DE CADA EXTENSION.
#autor	        :Elias Nieva Prieto
#fecha          :2019-06-14
#version        :0.6.14
#uso		    :sh generabulk.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                          INICIAMOS EL SCRIPT                             #
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
FOLDER2="scripts"
HORA=`date +%y%m%d-%H`

#RUTAS DE ARCHIVOS"
RUTA_CHK="/opt/CHAR/checking"
RUTA_CHAR="/opt/CHAR/"
RUTA_ASK="/etc/asterisk/"
reset
banner

# MENU DE VARIABLES Y OPCIONES
VAR0="Crea 1 RANGO de Habitaciones"
VAR1="Crea Varios RANGOS consecutivos en 1 solo archivo"
VAR2="Edita archivo de RANGOS"
VAR3="Crea EXTENSIONES.CSV desde ARCHIVO de RANGOS"
VAR4="Crea 'SIP_CUSTOM_POST.CONF' desde archivo RANGOS"
VAR5="Añade 'SIP_CUSTOM_POST.CONF' MANUAL"
VAR6="Crea Checkinout%EXT%.php _SIN CHAR_ desde RANGOS"
VAR7="░░▒▒▒▓▓▓▓   VOLVER A MENU AVANZADO    ▓▓▓▓▒▒▒░░"
VAR8="██████   VOLVER A ESTADOS    ██████"
VARFIN="██████       SALIR         ██████"

# Opciones Avanzadas de Control de la Pbx de Forma facil como editar Ficheros importantes directamente
 AVANZA='Por Favor seleccione una de las siguientes opciones para editar contenido del Script: '

  options=("$VAR0" "$VAR1" "$VAR2" "$VAR3" "$VAR4" "$VAR5" "$VAR6" "$VAR7" "$VAR8" "$VARFIN")
                    select opt in "${options[@]}"
                     do
                    case $opt in

	#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 0
	"$VAR0")
                        clear
                        echo "========================1º========================="
                        echo 'Introduzca una nº de Habitación para la secuencia:'
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo "================================================="
                        echo NºHab:
                        read HABSTART

                        clear
                        echo "======================2º========================="
                        echo " $HABSTART sera el principio de la Secuencia"
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        echo 'FIN de la secuencia:'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo NºHab:
                        read HABFIN
                        echo "==============================================="

                        cp ~/scripts/muestra.csv ~/scripts/extensions.csv

                            for i in $(seq $HABSTART $HABFIN);
                                do
                                    # echo $LINEA >>extensions.csv

                                    echo "$i,,\"$i\",novm,0,,,,,,,,,,,default,$i,sip,SIP/$i,fixed,$i,\"$i\",,dontcare,dontcare,dontcare,dontcare,disabled,10,disabled,enabled,$i,3,,,no,\"device <$i>\",no,from-internal,,0.0.0.0/0.0.0.0,,rfc2833,no,no,dynamic,no,,,no,0.0.0.0/0.0.0.0,5060,yes,60,no,$i.aaa!$i,pai,accept,chan_sip,\"udp,tcp,tls\",yes,friend,inherit,ENABLED,ringallv2-prim,20,,$i,,\"ext-local,$i,dest\",,,,,Ring,7,novm,default,,,"         >>/root/scripts/extensions.csv

                        done
                            mv ~/scripts/extensions.csv $RUTA_CHAR/extensions.csv
			clear
echo "-----------------------------------------------------------"
echo "Rango creado de la Habitación $HABSTART hasta la $HABFIN"
echo "-----------------------------------------------------------"
	~/scripts/generabulk.sh
			break
	;;
	#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 0
	"$VAR1")
                        for s in $(seq 1 20);
                        do
                        echo "========================1º========================="
                        echo 'Introduzca una nº de Habitación para la secuencia:'
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo "================================================="
                        echo NºHab:
                        read HABSTART

                        clear
                        echo "======================2º========================="
                        echo " $HABSTART sera el principio de la Secuencia"
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        echo 'FIN de la secuencia:'
                        echo "================================================="
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo NºHab:
                        read HABFIN


                        cp ~/scripts/muestra.csv ~/scripts/extensions.csv

                            for i in $(seq $HABSTART $HABFIN);
                                do
                                    # echo $LINEA >>extensions.csv
                                    echo "$i,,\"$i\",novm,0,,,,,,,,,,,default,$i,sip,SIP/$i,fixed,$i,\"$i\",,dontcare,dontcare,dontcare,dontcare,disabled,10,disabled,enabled,$i,3,,,no,\"device <$i>\",no,from-internal,,0.0.0.0/0.0.0.0,,rfc2833,no,no,dynamic,no,,,no,0.0.0.0/0.0.0.0,5060,yes,60,no,$i.aaa!$i,pai,accept,chan_sip,\"udp,tcp,tls\",yes,friend,inherit,ENABLED,ringallv2-prim,20,,$i,,\"ext-local,$i,dest\",,,,,Ring,7,novm,default,,,"         >>/root/scripts/extensions.csv

                        done
echo "-----------------------------------------------------------"
echo "Rango creado de la Habitación $HABSTART hasta la $HABFIN"
echo "-----------------------------------------------------------"
                        done
                        mv ~/scripts/extensions.csv $RUTA_CHAR/extensions.csv
			clear
	~/scripts/generabulk.sh
			break
	;;
	#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 2
	"$VAR2")

        		echo "$VAR2 se abrira automaticamente \'CTRL + X \' para Salir y Guardar."
                sleep 3
                    nano ~/scripts/rangos.sh
				clear
echo "-----------------------------------------------------------"
echo "El Archivo RANGOS se ha creado CORRECTAMENTE."
echo " RECUERDA EJECUTAR LA OPCION '4' para convertirlo al archivo CSV"
echo " que se ecuentra en $RUTA_CHAR/extensions.csv"
echo "-----------------------------------------------------------"
	~/scripts/generabulk.sh
			break
    ;;

    "$VAR3")

                        clear
                        cp ~/scripts/muestra.csv ~/scripts/extensions.csv

                        for LINEA in `cat /root/scripts/rangos.sh ` #LINEA guarda el resultado del fichero /root/scripts/rangos.sh
                        do
                        HABSTART=`echo $LINEA | cut -d ":" -f1` #Extrae Habitación de Inicio
                        HABFIN=`echo $LINEA | cut -d ":" -f2` #Extrae Habitación de FIN de rango

                             for i in $(seq $HABSTART $HABFIN);
                                do
                       echo "$i,,\"$i\",novm,0,,,,,,,,,,,default,$i,sip,SIP/$i,fixed,$i,\"$i\",,dontcare,dontcare,dontcare,dontcare,disabled,10,disabled,enabled,$i,3,,,no,\"device <$i>\",no,from-internal,,              0.0.0.0/0.0.0.0,,rfc2833,no,no,dynamic,no,,,no,0.0.0.0/0.0.0.0,5060,yes,60,no,$i.aaa!$i,pai,accept,chan_sip,\"udp,tcp,tls\",yes,friend,inherit,ENABLED,ringallv2-prim,20,,$i,,\"ext-local,$i,dest\",,,,,Ring,7,novm,default,,,"         >>/root/scripts/extensions.csv
                        echo "$i - OK $date" >>/opt/CHAR/Rango_OK.txt
                        echo "$i - OK $date"
                        done
                        done
                           mv ~/scripts/extensions.csv $RUTA_CHAR/extensions.csv

echo "-----------------------------------------------------------"
echo "Ultimo rango creado de la Habitación $HABSTART hasta la $HABFIN"
echo "-----------------------------------------------------------"
	~/scripts/generabulk.sh
			break
	;;
#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 4
	"$VAR4")
            #DATOS DE MUESTRA
            #
            # [9](+)
            # setvar=HABITACION=9
            # context=habitaciones
			clear
                        cp ~/scripts/muestraSIP.conf ~/scripts/sip_custom_post.conf.NUEVO

                        for LINEA in `cat /root/scripts/rangos.sh ` #LINEA guarda el resultado del fichero /root/scripts/rangos.sh
                        do
                        HABSTART=`echo $LINEA | cut -d ":" -f1` #Extrae Habitación de Inicio
                        HABFIN=`echo $LINEA | cut -d ":" -f2` #Extrae Habitación de FIN de rango

                             for i in $(seq $HABSTART $HABFIN);
                                do
                        echo ""         >>/root/scripts/sip_custom_post.conf.NUEVO
                        echo "[$i](+)"         >>/root/scripts/sip_custom_post.conf.NUEVO
                        echo "setvar=HABITACION=$i"         >>/root/scripts/sip_custom_post.conf.NUEVO
                        echo "context=habitaciones"         >>/root/scripts/sip_custom_post.conf.NUEVO
                        echo "$i - OK $date" >>/opt/CHAR/Rango_OK.txt
                        echo "$i - OK $date"
                        done
                        done
                           mv ~/scripts/sip_custom_post.conf.NUEVO $RUTA_CHAR/sip_custom_post.conf.NUEVO
clear

echo "------------------------------------------------------------------------------------------------------"
echo "  Archivo sip_custom_post.conf.NUEVO Creado desde RANGOS y Movido a Carpeta ASTCHAR de la Centralita  "
echo "                                -------------------------------------                                 "
echo "  ¡¡¡IMPORTANTE!!! No olvides ponerlo en /etc/asterisk/ y renombrarlo manualmente ¡¡¡¡IMPORTANTE!!!  "
echo "------------------------------------------------------------------------------------------------------"

                ~/scripts/generabulk.sh
			break
	;;
#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 5
	"$VAR5")
            #DATOS DE MUESTRA
            #
            # [9](+)
            # setvar=HABITACION=9
            # context=habitaciones
                        clear
                        cat $RUTA_CHAR/sip_custom_post.conf.NUEVO
                        echo "================================================="
                        echo " ESTAS SON LAS ULTIMAS HABITACIONES AÑADIDAS"
                        echo "==================================================="
                        echo 'Introduzca una nº de Habitación para la secuencia:'
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo "==================================================="
                        echo NºHab:
                        read HABSTART

                        clear
                        echo "======================2º========================="
                        echo " $HABSTART sera el principio de la Secuencia"
                        echo "======================2º========================="
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        echo 'FIN de la secuencia:'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo NºHab:
                        read HABFIN
                        echo "==============================================="

                             for i in $(seq $HABSTART $HABFIN);
                                do
                        echo ""         >>$RUTA_CHAR/sip_custom_post.conf.NUEVO
                        echo "[$i](+)"         >>$RUTA_CHAR/sip_custom_post.conf.NUEVO
                        echo "setvar=HABITACION=$i"         >>$RUTA_CHAR/sip_custom_post.conf.NUEVO
                        echo "context=habitaciones"         >>$RUTA_CHAR/sip_custom_post.conf.NUEVO
                        echo "$i - OK $date" >>/opt/CHAR/Rango_OK.txt
                        echo "$i - OK $date"
                        done
                        clear

echo "------------------------------------------------------------------------------------------------------"
echo "  Archivo sip_custom_post.conf.NUEVO Modificado manualmente y Movido a Carpeta ASTCHAR de la Centralita  "
echo "                                -------------------------------------                                 "
echo "  ¡¡¡IMPORTANTE!!! No olvides ponerlo en /etc/asterisk/ y renombrarlo manualmente ¡¡¡¡IMPORTANTE!!!  "
echo "------------------------------------------------------------------------------------------------------"
                ~/scripts/generabulk.sh
			break
	;;
#####  AQUI EMPIEZA LA OPCION DEL MENU DE LA VARIABLE 6 (checkinout%ext%.php)
	"$VAR6")
			clear
                        ls  $RUTA_CHK/checkinout*.php
                       echo ''
read -r -p '¿Quieres Hacerlo desde ARCHIVO-RANGOS Pulsa " SI " o "NO" Para Hacerlo Manual ?' input

case $input in
    [sS][iIE]|[sS])
 echo "Si"
                                for LINEA in `cat /root/scripts/rangos.sh ` #LINEA guarda el resultado del fichero /root/scripts/rangos.sh
                                    do
                                    HABSTART=`echo $LINEA | cut -d ":" -f1` #Extrae Habitación de Inicio
                                    HABFIN=`echo $LINEA | cut -d ":" -f2` #Extrae Habitación de FIN de rango

                                        for i in $(seq $HABSTART $HABFIN);
                                        do
                                 rm -f /opt/CHAR/checking/checkinout$i.php
                               touch /opt/CHAR/checking/checkinout$i.php
                               echo "#!/usr/bin/php -q " >>/opt/CHAR/checking/checkinout$i.php
                               echo '<?php' >>/opt/CHAR/checking/checkinout$i.php
                               echo "    require('phpagi.php');" >>/opt/CHAR/checking/checkinout$i.php
                               echo " " >>/opt/CHAR/checking/checkinout$i.php
                               echo '    $agi= new AGI();' >>/opt/CHAR/checking/checkinout$i.php
                               echo '    $agi->set_variable("CONTEXTO","hab-libre");' >>/opt/CHAR/checking/checkinout$i.php
                               echo '    $agi->set_variable("LANGUAGE","1");' >>/opt/CHAR/checking/checkinout$i.php
                               echo '    $agi->set_variable("NOMBRE"," '$INDICE\-$i' ");' >>/opt/CHAR/checking/checkinout$i.php
                               echo '?>' >>/opt/CHAR/checking/checkinout$i.php
                               echo "" >>/opt/CHAR/checking/checkinout$i.php
                               echo "$i - OK $date" >>/opt/CHAR/checkinout_OK.txt
                               echo "$i - OK $date"
                                        done
                                done


 ;;
    [nN][oO]|[nN])
    # echo "No"
                        echo "================================================="
                        echo " ESTAS SON LAS ULTIMAS HABITACIONES AÑADIDAS"
                        echo "==================================================="
                        echo 'Introduzca una nº de Habitación para la secuencia:'
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo "==================================================="
                        echo NºHab:
                        read HABSTART

                        clear
                        echo "================================================="
                        echo " $HABSTART sera el principio de la Secuencia"
                        echo "================================================="
                        echo 'Para en Cualquier Momento Presionando "Ctrl+Z"'
                        echo 'FIN de la secuencia:'
                        #leer el dato del teclado y guardarlo en la variable de usuario var1
                        echo NºHab:
                        read HABFIN
                        echo "==============================================="

                             for i in $(seq $HABSTART $HABFIN);
                                do
                        touch /opt/CHAR/checking/checkinout$i.php
                        echo "#!/usr/bin/php -q " >>/opt/CHAR/checking/checkinout$i.php
                        echo '<?php' >>/opt/CHAR/checking/checkinout$i.php
                        echo "    require('phpagi.php');" >>/opt/CHAR/checking/checkinout$i.php
                        echo " " >>/opt/CHAR/checking/checkinout$i.php
                        echo '    $agi= new AGI();' >>/opt/CHAR/checking/checkinout$i.php
                        echo '    $agi->set_variable("CONTEXTO","hab-libre");' >>/opt/CHAR/checking/checkinout$i.php
                        echo '    $agi->set_variable("LANGUAGE","1");' >>/opt/CHAR/checking/checkinout$i.php
                        echo '    $agi->set_variable("NOMBRE"," '$INDICE\-$i' ");' >>/opt/CHAR/checking/checkinout$i.php
                        echo '?>' >>/opt/CHAR/checking/checkinout$i.php
                        echo "" >>/opt/CHAR/checking/checkinout$i.php

                        echo "$i - OK $date" >>/opt/CHAR/checkinout_OK.txt
                        echo "$i - OK $date"
                        done
                        clear



       ;;
    *)
 echo "Entrada Invalida "
 exit 1
 ;;
esac

ls  $RUTA_CHK/checkinout*.php
echo "------------------------------------------------------------------------------------------------------"
echo " "
echo "  Archivos hasta el checkinout$i.php Creado manualmente   "
echo " "
echo "------------------------------------------------------------------------------------------------------"
                avanzado
			break
	;;
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                  OPCION 8 SALIR Y VOLVER A MENU AVANZADO                                   #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
	"$VAR7")
			clear
                avanzado
			break
	;;
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                  OPCION 8 SALIR Y VOLVER A ESTADOS                                    #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
	"$VAR8")
			clear
                estado
			break
	;;
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                  OPCION FIN SALIR                                 #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
	"$VARFIN") #██████   SALIR    ██████"
                        clear
                             	echo -e "${nc}Ejecute de nuevo \"${Rojo}estado${nc}\" para modificar las opciones de las Habitaciones así como los nombre"
                                break
                         ;;

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                           VALORES ERRONEOS                                   #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

 *) echo "Seleccion Incorrecta $REPLY";;
        esac
     done


#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                                                                                                                   FIN DEL SCRIPT                        #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
