#!/bin/bash -   
#Titulo         :prueba2222.sh
#Descripción   :Prueba 222 de creascript
#Autor          :3lN1Pr1
#Fecha          :2019-05-28
#Versión       :2      
#uso            :./prueba2222.sh
#Notas          :       
#bash_version   :4.4.19(1)-release
#E-mail         :nombre@servidor.com
#Empresa        :NOMBRE DE LA EMPRESA
#Telefono       :666 999 999
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh  #PONER AQUI LA RUTA GENERICA DEL ARCHIVO DE VARIABLES
source $VARIABLE

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.

:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo $FECHA
echo $HORA
echo $USERID
echo $IP
echo $IP2
echo $VARIABLE_EJEMPLO
!
                        

 :<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh
Amarillo_Azul_Azulclaro_Blanco_CABINA_Cyan_Cyanclaro_FOLDER1_Grisclaro_Grisoscuro_HAB9_HABSTART_INDICE_LIMIT_Marron_nc_Negro_Purpura_Purpuraclaro_Rojo_Rojoclaro_ROMCAB_ROOTSCRIPT_SALIDA_URL1_Verde_Verdeclaro_
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
echo Finalizado........
