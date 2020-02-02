#!/bin/bash -   
#Titulo         :portal1.sh
#Descripción   :Crea hoteles nuevos en el portal del HotSpot2.0
#Autor          :Elías Nieva
#Fecha          :2019-12-27
#Versión       :BG1219.v001
#uso            :./portal1.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
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

# ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo -e "${blue}$FECHA$nc)"
echo $HORA
echo $USERID
echo $IP
echo $IP2
echo $VARIABLE_EJEMPLO

 :<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh
Amarillo_Azul_Azulclaro_banner_Blanco_CABINA_CARPETA_Cyan_Cyanclaro_FOLDER1_Grisclaro_Grisoscuro_HAB9_HABSTART_INDICE_LIMIT_Marron_nc_Negro_PASSWORD_printf_Purpura_Purpuraclaro_Rojo_Rojoclaro_ROMCAB_ROOTSCRIPT_SALIDA_trap_URL_URL1_VER_Verde_Verdeclaro_
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
