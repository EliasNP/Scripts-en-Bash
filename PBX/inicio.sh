#!/bin/bash
CREADOR=Elías_Nieva #Informatica@ctbell.com

# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=~/scripts/variables.sh 
source $VARIABLE 
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`

# Comprobamos si existe el Fichero de Checking de la Habitación y el registro en Variables.sh si es así escribimos la información resultante.

for i in $(seq 1 9999);
do
  	#Deficinicion de Variables propias del Archivo.
        NAME=$INDICE\-$ROOM
        ARCHIVO=/opt/CHAR/checking/checkinout$ROOM.php
    if [ -f $ARCHIVO ]
        then
		# Buscar por Texto en "$VARIABLE" para comprobar existencia de la linea
    		if grep -R 'NOMBRE",""' $ARCHIVO
    			then
    				sed -i "s/HAB$ROOM=.*/HAB$ROOM=\"$NAME\"/gi" $VARIABLE
    				echo  to: $INDICE$ROOM="$NAME"
					echo  to: $INDICE$ROOM="$NAME" >> /var/log/insertname$FECHA.log
                    # Insertamos los datos en Checkinout%ROOM% para la variable ==> $agi->set_variable("NOMBRE","EJEMPO_Num");
                    sed -i "s/\"NOMBRE\",.*/\"NOMBRE\",\"$NAME\");/gi" $ARCHIVO
                    # Sumamos 1 valor a la variable $ROOM para ir a la siguiente.
                   ((ROOM++))
                    #echo Siguiente \=\=\> $ROOM .
            #echo ______________________________________
    			else
    				echo TIENE NOMBRE: 
				grep -R 'NOMBRE",' $ARCHIVO
                    # Insertamos los datos en Checkinout%ROOM% para la variable ==> $agi->set_variable("NOMBRE","EJEMPO_Num");
                    #sed -i "s/\"NOMBRE\",.*/\"NOMBRE\",\"$NAME\");/gi" $ARCHIVO
                    # Sumamos 1 valor a la variable $ROOM para ir a la siguiente.
                    ((ROOM++))
                    # echo Siguiente \=\=\> $ROOM .
            #echo ______________________________________
                    
        	fi

        else

            #echo NO existe el $ARCHIVO
                    # Sumamos 1 valor a la variable $ROOM para ir a la siguiente.
                    ((ROOM++))
            #echo Siguiente \=\=\> $ROOM.
            #echo ______________________________________
    fi
done
