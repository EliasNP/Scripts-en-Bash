#!/bin/bash
# ESTE SCRIPT DESCARGA LAS ULTIMAS VERISONES DE LOS SCRIPTS PARA EL USUARIO
#
clear
ls -l /root/
echo Introduce el Nombre de la Carpeta donde quieres descargar los Scripts por Defecto \"scripts\"
read FOLDER2

# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=/root/$FOLDER2/variables.sh
source $VARIABLE
HORA=`date +%y%m%d-%H`

if [ -f "$VARIABLE" ]
        then
                    clear
                    echo -------------------------------------------------------
                    echo /root/$FOLDER2/ Encontrada, podemos seguir actualizando.
                    echo -------------------------------------------------------
                    mv -f /root/$FOLDER2/ /root/$HORA-$FOLDER2-BACKUP --backup
                    URLACTUALIZA=$URL1
                    echo Se ha creado la carpeta /root/$HORA-$FOLDER2-BACKUP como Copia de Seguridad
                    echo Pulsa cualquier tecla para crear la carpeta $FOLDER2 y comenzar con la descarga
                    read CONTINUIM

		else
                    clear
                    echo NO existe /root/$FOLDER2/
                    echo Pulsa cualquier tecla para crear la carpeta $FOLDER2 y comenzar con la descarga
                    read WTF
clear
                        echo Introduce la Url de donde descargar el archivo nuevo
                        echo "Por defecto\:  http://84.232.5.8/ctbell/rootscripts.tar.gz"
                        read URLACTUALIZA
                        clear
        	fi

# Creamos la Carpeta contenedora
                        clear
                        echo -------------------------------------------------------
                        echo Creamos la Carpeta contenedora

                        mkdir /root/$FOLDER2/
                        echo Directorio /root/$FOLDER2/  Creado
                        cd /root/$FOLDER2/
                        ls -l
# Descargamos los archivos desde el servidor.

                        echo 2º Descargamos los archivos
                        wget -N $URLACTUALIZA
                        wget -N -P /etc/yum.repos.d -i http://radius.ctbell.com/ctbell/repo/repos.txt
                        echo -------------------------------------------------------
                        echo Archivo Descargado
                        echo Pulsa una tecla para continuar para Continuar
sleep 2
                    clear
# Descomprimimos los archivos en su ubicación correcta.
                        echo Descomprimimos los archivos de \"rootscripts.tar.gz\"
                        tar -xzvf rootscripts.tar.gz
                        rm -r rootscripts.tar.gz
                        ls -l
                        echo -------------------------------------------------------
sleep 2
                    clear
# Convertimos todos en Ejecutables.
                        chmod +x *.sh

# Convertimos estado.sh y timer.sh en comandos del sistema.

                        ln -f /root/$FOLDER2/estado.sh /usr/bin/estado
                        ln -f /root/$FOLDER2/avanzado.sh /usr/bin/avanzado
                        ln -f /root/$FOLDER2/timer.sh /usr/bin/timer
                        ln -f /root/$FOLDER2/cabina.sh /usr/bin/cabina
                        ln -f /root/$FOLDER2/descarga /usr/bin/descarga
                        ln -f /root/$FOLDER2/tmsg.sh /usr/bin/tmsg
                        ln -f /root/$FOLDER2/instalactbell.sh /usr/bin/instalactbell
                        ln -f /root/$FOLDER2/logoctb.sh /etc/profile.d/logoctb.sh
                        echo -------------------------------------------------------
                        echo ln -f /root/$FOLDER2/estado.sh /usr/bin/estado
                        echo ln -f /root/$FOLDER2/avanzado.sh /usr/bin/avanzado
                        echo ln -f /root/$FOLDER2/timer.sh /usr/bin/timer
                        echo ln -f /root/$FOLDER2/cabina.sh /usr/bin/cabina
                        echo exportado los comandos a usr\/bin
sleep 2
                        echo TODO FINALIZADO
                        echo -------------------------------------------------------
############################ SEGUNDA PANTALLA ############################
clear
                        echo -
                        echo  Ya puedes usar el nuevo comando \"estado\" para acceder al Menú especial de C.T.Bell.slu
                        echo -
                        echo  Tambien puedes usar el comando  \"timer\" para ver como se carga el nombre y la extension de la cabina
                        echo  ----------------------------------------------------------------------------------------------------------
                        echo  IMPORTANTE\:
                        echo  Recuerda modificar el archivo $VARIABLE en caso de que sea necesario con el comando\:
                        echo  Ej\:\[nano $VARIABLE \]
                        echo  Los valores actuales de las variables son \:
                        echo  -----------------------------------------------------------------------
                        echo  $INDICE  - Es el indice para poner delantede los numeros de Habitación.
                        echo  -
                        echo  $HABSTART  - Es la Habitación de Inicio.
                        echo  -
                        echo  $LIMIT  - Es el nº de la Habitación final para el Loop.
                        echo  ------------------------------------------------------------------------
                        echo  El Fichero de salida donde el Driver del \"CHAR\" cargara los nombres en los CheckIn-Out es\:
                        echo  $SALIDA
                        echo -
                        echo Pulsa una tecla para continuar para Finalizar
                        read FINAL
#### INSERTA LA NÜEVA CARPETA DE VARIABLES PARA EL FUTURO
sed -i "s/FOLDER1=.*/FOLDER1=\"$FOLDER2\"/gi" $VARIABLE
echo sed -i "s/FOLDER1=.*/FOLDER1=\"$FOLDER2\"/gi" $VARIABLE


 Seleccion='Por Favor seleccione una de las siguientes opciones: '

   options=("ESTADO" "TIMER" "EDITAR VARIABLE" "SALIR")
                      select opt in "${options[@]}"
                        do
                        case $opt in

	"ESTADO")
		echo Ejecutando ESTADO \"Pulsa \'Ctrl + C\` para escapar al \bash o la opcion \"10\"
			/root/$FOLDER2/estado.sh

break
	;;
	"TIMER")
		echo Ejecutando Timer \"Pulsa \'Ctrl + C\` para escapar al \bash
      	/root/$FOLDER2/timer.sh
break
	;;
	"EDITAR VARIABLE")
        nano $VARIABLE
break
	;;

	"SALIR")
			clear
                echo Te llevo a la Carpeta $FOLDER2
                cd $FOLDER2
                ls -la
            break
	;;


                    *) echo "Seleccion Incorrecta $REPLY";;
                     esac
                        done
