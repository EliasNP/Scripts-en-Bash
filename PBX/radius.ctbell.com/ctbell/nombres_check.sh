#!/bin/bash
#titulo         :Inicio2.sh
#descripcion    :Este Script Lista los nombres de los archivos Checkinout%ROOM y los exporta a un fichero para que sea facil leerlos
#autor	        :Elias Nieva Prieto
#fecha          :2019-08-13
#version        :0.2
#uso		    :sh Inicio2.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`


#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                           INICIAMOS EL SCRIPT                             #
#░░▒▒▒▓▓▓▓████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░

# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
source $VARIABLE
for i in $(seq $HABSTART $LIMIT);
do
        #Deficinicion de Variables propias del Archivo.
        NAME=$INDICE\-$ROOM
        ARCHIVO=/opt/CHAR/checking/checkinout$ROOM.php
    if [ -f $ARCHIVO ]
        then
		echo "_____________________________________" >> /opt/CHAR/Nombres_chekinout.txt
		echo " >>>       chekinout$ROOM.php     <<< " >> /opt/CHAR/Nombres_chekinout.txt
		grep -R 'NOMBRE","' $ARCHIVO  >> /opt/CHAR/Nombres_chekinout.txt
		# Sumamos 1 valor a la variable $ROOM para ir a la siguiente.
                    ((ROOM++))
        else

            # echo NO existe el $ARCHIVO
                    # Sumamos 1 valor a la variable $ROOM para ir a la siguiente.
                    ((ROOM++))
            # echo ______________________________________
    fi
done

echo ___________________ $FECHA ___ $HORA ______________________ >> /opt/CHAR/Nombres_chekinout.txt

cat /opt/CHAR/Nombres_chekinout.txt
