#!/bin/bash
#titulo         :registro.sh
#descripcion    :Este Script Controla si la PBX tiene Linea con LCR
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-31
#version        :0.5-31
#uso		    :./registro.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                     INICIAMOS ESTADO DE VARIABLES                         #
#============================================================================

# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
source $VARIABLE
ARCHIVO=registro
VER=V.6-01.800

# ===========================================================================================================================
                      # Script para comprobar el estado de la conexion con la Linea IP y/o puerto bloqueado.
                    		# COMANDO PARA EXPORTAR LA LINEA DEL LOG DE ASTERISK.
                    		# grep "2019-03-29 11:24:*.*'from_lcr' is now" /var/log/asterisk/full
                            # Ejemplo de Resultado "[2019-03-29 11:24:31] NOTICE[2487] chan_sip.c: Peer 'from_lcr' is now Reachable. (55ms / 2000ms)"
                            # Ejemplo de Resultado "[2019-03-29 11:24:31] NOTICE[2487] chan_sip.c: Peer 'from_lcr' is now UNREACHABLE! (55ms / 2000ms)"
# ===========================================================================================================================
# DEFINICION DE VARIABLES
FOLDER2="scripts"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`

EXTRAEOK="$(grep "$FECHA $HORA:*.* 'from_lcr' is now Reachable" /var/log/asterisk/full)"
EXTRAEBAD="$(grep "$FECHA $HORA:*.*'from_lcr' is now UNREACHABLE" /var/log/asterisk/full)"
EXTRAELAG="$(grep "$FECHA $HORA:*.*'from_lcr' is now Lagged" /var/log/asterisk/full)"

# ESTADOOK="$(grep "Reachable" $EXTRAE)"
#RUTAS DE ARCHIVOS"
RUTA_CHK="/opt/CHAR/checking"
RUTA_CHAR="/opt/CHAR/"
RUTA_ASK="/etc/asterisk/"

# ===========================================================================================================================
# ===========================================================================================================================
#enviamos el resultado del GREP a log FULL de Asterisk a una VARIABLE Para su posterior consulta mas Facil.
echo "BUENO - $EXTRAEOK"
echo "LAG - $EXTRAELAG"
echo "MALO - $EXTRAEBAD"

# ===========================================================================================================================
# ===========================================================================================================================
if [ -n "$EXTRAEOK" ]; then
#   echo "not empty"
    echo "BUENO - $EXTRAEOK"
    tmsg "CON LINEA DESDE $FECHA $HORA *OK*"
else
    if [ -n "$EXTRAEBAD" ]; then
#   echo "not empty"
    echo "MALO - $EXTRAEBAD"
    tmsg "!!!ALERTA¡¡¡¡ -SIN- Linea $FECHA $HORA "
        else
		if [ -n "$EXTRAELAG" ]; then
		echo "MALO - $EXTRAELAG"
		tmsg "!!!ALERTA¡¡¡¡ LAG _SIN_ Linea $FECHA $HORA "
		else
		echo "Todo Vacio $FECHA $HORA"
		fi
        fi
fi
