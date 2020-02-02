#!/bin/bash
#Titulo         :mysqlins.sh
#Descripción   :Script para la inserccion automatica en base de datos Sql de informacion de las actualizaciones
#Autor          :Elías Nieva
#Fecha          :2019-11-07
#Versión       :AJNO07VA.01
#uso            :./mysqlins.sh
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
exter=`curl ifconfig.co`

HOST=`hostname`
PBXIPETH0=$IP
PBXIPETH1=$IP2
PBXIPEXT=$exter
VERSION=`grep -R "#version" /root/scripts/estado.sh`
NUMVER=`echo $VERSION | cut -d ":" -f2`

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.

# ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.

mysql --host=remotemysql.com -uO5aw9WkDqf -pNtmmS8UFW7 O5aw9WkDqf << EOF
INSERT INTO Registrospbx (Host,PBXIPETH0,PBXIPETH1,PBXIPEXT,PBXVER,FECHA) VALUES ('$HOST', '$PBXIPETH0', '$PBXIPETH1', '$PBXIPEXT', '$NUMVER', '$FECHA $HORA');
EOF


:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh
Amarillo_Azul_Azulclaro_banner_Blanco_CABINA_CARPETA_Cyan_Cyanclaro_FOLDER1_Grisclaro_Grisoscuro_HAB9_HABSTART_INDICE_LIMIT_Marron_nc_Negro_PASSWORD_printf_Purpura_Purpuraclaro_Rojo_Rojoclaro_ROMCAB_ROOTSCRIPT_SALIDA_trap_URL_URL1_VER_Verde_Verdeclaro_
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
