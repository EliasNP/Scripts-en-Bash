#!/bin/bash

# Basic if statement

 YEAR=`date +%y`
 DIA=`date +%d`
 MES=`date +%m`
 HORA=`date +%H%M`

# Este Script Borra los archivos de Log, registro y e-mail antiguos así como los mensajes de voz de mas de 30 días.

	#Esta linea encuentra los archivos de registro de + de 3 dias en la carpeta "temporales" y los mueve a la carpeta de copia de seguridad.
		find /home/asterisk/temporales/*.txt -mtime +3 -type f -exec mv {} /home/asterisk/bak \;

	#Esta linea encuentra los archivos de LOG de + de 3 dias en la carpeta "AUDIOS" y los mueve a la carpeta de copia de seguridad.
                find /home/asterisk/audios/*.SIN_ARCHIVOS -mtime +3 -type f -exec mv {} /home/asterisk/bak \;

	#Esta linea encuentra todos los archivos de + de 30 dias en la carpeta "AUDIOS" y los mueve a la carpeta de copia de seguridad.
                find /home/asterisk/audios/ -mtime +30 -type f -exec mv {} /home/asterisk/bak \;

        #Esta linea encuentra y BORRA BAK todos los archivos de + de 35 dias en la carpeta "BAK"
                find /home/asterisk/bak -mtime +35 -type f -exec rm -Rf {} \;

echo Se han ejecutado las tareas correctamente de Copia y Borrado 20$YEAR/$MES/$DIA a la Hora $HORA. > /home/asterisk/temporales/Borrado-$DIA.txt
