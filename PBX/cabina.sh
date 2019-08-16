#!/bin/bash

# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=~/scripts/variables.sh
source $VARIABLE

# Variable ROOM Equivale a la extensión de la cabina por ejemplo la 700
ROOM=$ROMCAB

# La Variable NOMBRE equivale al nombre que queremos que aparezca en el Telefono de Recepción por Defecto "Cabina"
NOMBRE=$CABINA

FILE="/opt/CHAR/checking/checkinout$ROOM.php"

# Inserta el nombre de la Habitación  en el archivo de control "variables.sh"
      	sed -i "s/HAB$ROOM=.*/HAB$ROOM=\"$NOMBRE\"/gi" $VARIABLE

# El comando "sed" inserta en la variable "$NOMBRE" a la variable "$FILE" en su posición correcta.
#	sed -i "s/\"CONTEXTO\",\"hab-libre\"/\"CONTEXTO\",\"hab-ocupada\");/gi" $FILE
     	sed -i "s/\"NOMBRE\",.*/\"NOMBRE\", \"$NOMBRE\");/gi" $FILE

      	echo ======================

echo Extensión $ROOM Asignada con el Nombre $NOMBRE en el Archivo $FILE

      	echo ======================
