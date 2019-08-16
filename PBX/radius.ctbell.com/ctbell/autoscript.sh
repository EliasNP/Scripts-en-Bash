#!/bin/bash
# ESTE SCRIPT DESCARGA LAS ULTIMAS VERISONES DE LOS SCRIPTS PARA EL USUARIO
#
FOLDER2=scripts
# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=~/$FOLDER2/variables.sh
source $VARIABLE
HORA=`date +%y%m%d-%H`

if [ -f "$VARIABLE" ]
        then
                    clear
                    echo -------------------------------------------------------
                    echo ~/$FOLDER2/ Encontrada, podemos seguir actualizando.
                    echo -------------------------------------------------------
                    mv -f ~/$FOLDER2/ ~/$HORA-$FOLDER2-BACKUP --backup
                    URLACTUALIZA=$URL1
                    echo Se ha creado la carpeta ~/$HORA-$FOLDER2-BACKUP como Copia de Seguridad
		else
                    clear
                    echo NO existe ~/$FOLDER2/
clear
                        echo Introduce la Url de donde descargar el archivo nuevo
                        URLACTUALIZA=http://84.232.5.8/ctbell/rootscripts.tar.gz
                        URLACTUALIZAWEB=http://84.232.5.8/agenda/agenda.tar.gz
                        clear
        	fi
# Creamos la Carpeta contenedora
                        clear
                        echo -------------------------------------------------------
                        echo Creamos la Carpeta contenedora
                        mkdir ~/$FOLDER2/
                        echo Directorio ~/$FOLDER2/  Creado
                        cd ~/$FOLDER2/
# Descargamos los archivos desde el servidor.
                        echo 2º Descargamos los archivos
                        wget $URLACTUALIZA
                        wget $URLACTUALIZAWEB
                        echo -------------------------------------------------------
                        echo Archivos Descargado
                        echo Pulsa una tecla para continuar para Continuar
# Descomprimimos los archivos en su ubicación correcta.
                        echo Descomprimimos los archivos de \"rootscripts.tar.gz\"
                        tar -xzvf rootscripts.tar.gz
                        rm -r rootscripts.tar.gz
                        ls -l
                        echo -------------------------------------------------------
# Convertimos todos en Ejecutables.
                        chmod +x *.sh
# Convertimos estado.sh y timer.sh en comandos del sistema.
                        ln -f ~/$FOLDER2/estado.sh /usr/bin/estado
                        ln -f ~/$FOLDER2/avanzado.sh /usr/bin/avanzado
                        ln -f ~/$FOLDER2/timer.sh /usr/bin/timer
                        ln -f ~/$FOLDER2/cabina.sh /usr/bin/cabina
                        ln -f ~/$FOLDER2/instalactbell.sh /usr/bin/instalactbell
                        ln -f ~/$FOLDER2/logoctb.sh /etc/profile.d/logoctb.sh
                        echo -------------------------------------------------------
                        echo TODO FINALIZADO
                        echo -------------------------------------------------------
# Crea / Actualiza Web LDAP Admin
                        sh ~/$FOLDER2/webldap.sh
############################ SEGUNDA PANTALLA ############################
clear
#### INSERTA LA NÜEVA CARPETA DE VARIABLES PARA EL FUTURO
sed -i "s/FOLDER1=.*/FOLDER1=\"$FOLDER2\"/gi" $VARIABLE
date +%y%m%d-%h
whoami
chmod +x /root/scripts/*
sh /etc/profile.d/logoctb.sh
