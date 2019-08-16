#!/bin/bash
#titulo         :find.sh
#descripcion    :Archivo que Encuentra Comprime y guarda los Audios en las Llamadas
#autor	        :Elias Nieva Prieto
#fecha          :2019-06-13
#version        :0.4
#uso		    :sh find.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#░░▒▒▒▓▓▓▓█████████████████████████████████████████████████████INICIAMOS ESTADO DE VARIABLES██████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
source $VARIABLE

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

# Basic if statement

 YEAR=`date +%y`

 DIA=`date +%d`

 MES=`date +%m`

 HORA=`date +%H%M`


if [ -d /var/spool/asterisk/monitor/20$YEAR/$MES/$DIA/ ];

then

echo La carpeta existe

# Creamos la carpeta de destino temporal

 mkdir /home/asterisk/temporales/$DIA

# Buscamos y movemos los archivos creados antes de un tiempo "55 min" para el ejemplo

        find /var/spool/asterisk/monitor/20$YEAR/$MES/$DIA/ -mmin +35 -type f -exec mv {} /home/asterisk/temporales/$DIA \;

# Comprimimos los archivos en las carpetas

        7z a /home/asterisk/audios/20$YEAR/$MES/$DIA/$HORA.7z -p$PASSWORD -mhe /home/asterisk/temporales/$DIA/*.wav
 	echo  Se crean los archivos comprimidos $HORA.7z El $DIA/$MES/$YEAR > /home/asterisk/temporales/$HORA-OK.txt

# Borramos los archivos de Audio originales para que no sean localizables.

       rm -R -f /home/asterisk/temporales/$DIA

# Borra el archivo comprimido si se ha generado en vacio

        find /home/asterisk/audios/ -size 32c -exec rm -f {} \;

# Creamos un Archivo de registro para comprobar que se ejecuta la tarea correctamente.

	touch /home/asterisk/temporales/logs/$YEAR-$MES-$DIA-$HORA.OK

# Asignamos permisos al usuario creado para la supervisión de los archivos

        chown -R inspector:grupo-X /home/asterisk/audios/

# Asignamos permisos exclusivos de Lectura y escritura "SOLO" al usuario supervisor

        chmod -R 677 /home/asterisk/audios

else

echo "NO HAY ARCHIVOS  $DIA $HORA $YEAR $MES" > /home/asterisk/temporales/logBAD.txt
touch /home/asterisk/audios/$YEAR-$MES-$DIA-$HORA.SIN_ARCHIVOS
echo "$PASSWORD"
banner
fi

