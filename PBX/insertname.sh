#!/bin/bash

# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=~/scripts/variables.sh
source $VARIABLE
HORA=`date +%H:%M`

#RUTA DE SALIDA (El Archivo que Genera el Driver de Char Especifico para esta integración.
# Ahora lo coge de $VARIABLES (SALIDA=/opt/CHAR/checking/salida.txt)

if grep -R "$ROOM:" $SALIDA
    then
        # Normalizamos el Fichero con los Nombres para evitar espacio convirtiendoloes en "_"
        sed -i "s/ /_/gi" $SALIDA

        for LINEA in `cat $SALIDA ` #LINEA guarda el resultado del fichero /opt/CHAR/checking/salida.txt
            do
             ROOM=`echo $LINEA | cut -d ":" -f1` #Extrae Habitación
             NOMBRE=`echo $LINEA | cut -d ":" -f2` #Extrae Nombre
            #    echo "$ROOM_ $NOMBRE" #Muestra resultado.

    FILE="/opt/CHAR/checking/checkinout$ROOM.php"

       if grep -R "$ROOM:" $SALIDA
        then
            # Inserta el nombre de la Habitación  en el archivo de control "variables.sh"
         	sed -i "s/HAB$ROOM=.*/HAB$ROOM=$NOMBRE/gi" $VARIABLE

            # Preguntamos si existe $FILE y si es así cambiamos el archivo Checkinout%Extension%.php
	        if [ -f "$FILE" ]
        		then
		        	# El comando "sed" inserta en la variable "$NOMBRE" a la variable "$FILE" en su posición correcta.
		        	sed -i "s/\"NOMBRE\",.*/\"NOMBRE\", \"$NOMBRE\");/gi" $FILE
                    echo Habitación: $ROOM \| $NOMBRE \| $HORA \| OK >> /var/log/insertname.log
		        else
		    	# Comprobación de que no se encuentra el archivo.
		    	echo Archivo "NO" Encontrado
        	fi
    else
      	echo ======================

    fi

    done

    rm -R $SALIDA

    else
        echo Salida.txt no se encuentra
        sleep 5
        clear
fi
