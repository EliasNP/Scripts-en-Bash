#!/bin/bash
#titulo         :variables.sh
#descripcion    :Variables Genericas para todos los Scripts de C.T.Bell
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-27
#version        :0.4
#uso		    :sh variables.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#============================================================================
#           CSS PARA ENRRIQUECER TEXTO CON COLORES Y SALTOS DE LINEA        #
#============================================================================

# Bash css!
Negro="\033[0;30m"
Grisoscuro="\033[1;30m"
Azul="\033[0;34m"
Azulclaro="\033[1;34m"
Verde="\033[0;32m"
Verdeclaro="\033[1;32m"
Cyan="\033[0;36m"
Cyanclaro="\033[1;36m"
Rojo="\033[0;31m"
Rojoclaro="\033[1;31m"
Purpura="\033[0;35m"
Purpuraclaro="\033[1;35m"
Marron="\033[0;33m"
Amarillo="\033[1;33m"
Grisclaro="\033[0;37m"
Blanco="\033[1;37m"
nc="\033[0m"

# Nombre que va delante del numero de Extensión Ej. CTBELL-100
INDICE="EXT"

# Extension de Inicio para el Contador.
HABSTART=100

# Extension Limite para el contador.
LIMIT=999

# Habitación por defecto para la cabina
ROMCAB="800"

# Nombre que aparecera en la extension de la Cabina
CABINA="$ROMCAB-CABINA"

# Fichero de salida donde el Driver del "CHAR" cargara los nombres en los CheckIn-Out
SALIDA=/opt/CHAR/checking/salida.txt

# Password para la compresion de Audios de llamadas
PASSWORD="icaroctbell"
