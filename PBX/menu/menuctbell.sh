#!/bin/bash
#titulo         :menuctbell.sh
#descripcion    :Este Script muestra un menú rapido para manejar opciones con las centralitas.
#autor	        :Elias Nieva Prieto
#fecha          :2019-08-22
#version        :0.0.1
#uso		:sh menuctbell.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
<<INFO
#░░▒▒▒▓▓▓▓███████████████████████████████████████████████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#  					                        TRABAJOS PREVIOS DE COMPROBACION                        
#░░▒▒▒▓▓▓▓▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼▓▓▓▓▒▒▒░░
INFO

#Recurso con más funciones y opciones genericas
source source/funciones.sh
source source/scripts_variables.sh
source source/variables.sh

# Store menu options selected by the user
INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# get text editor or fall back to nano_editor
nano_editor=${EDITOR-nano}

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

# Titulo de los Paginas de Dialog
CTBELL="C.T.Bell Menú   -    MENÚ DE OPCIONES      -      V.${NUMVER}                            ${FECHA} - ${HORA}"
MENU_TXT="Puedes usar las flechas ARRIBA ▲ /ABAJO ▼ \nTambien puedes presionar un número del 1-9 o Click con el Ratón para elegir una Opción del Menú \nELGE UNA OPCIÓN:"
BANNER=$(banner_CTBELL)
<<INFO
███████████████████████████████████████████████████
       DEFINICION DE FUNCIONES DE LOS MENÚS
█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█

		█████████████████████
                   display_output
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
 Purpose - display output using msgbox 
  	$1 -> set msgbox height
  	$2 -> set msgbox width
  	$3 -> set msgbox title
INFO
function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "${CTBELL}" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█



		█████████████████████
                   menu_principal
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function menu_principal(){
#
# Definimos el loop infinito
#
while true
do
### MUESTRA EL MENU PRINCIPAL ###
	dialog --clear  --help-button --backtitle "${CTBELL}" \
	--title "[ M E N U  - P R I N C I P A L ]" \
	--menu "${MENU_TXT} " 20 75 10 \
		1.VARIABLES "VER O MODIFICAR VARIABLES ESPECIFICAS DEL HOTEL" \
		2.GENERAR_EXTENSIONES "GENERAR EXTENSIONES" \
		3.CHAR_MANUAL "OPERACION CON EXTENSIONES 'ABRIR O CERRAR EXTENSIONES'" \
		4.GESTIONA_NOMBRES "VER, MODIFICAR O NOMBRAR EXTENSIONES" \
		5.CLI_DE_ASTERISK "CONSOLA DE ASTERISK" \
		6.GESTIONA_PERMISOS "FUERZA LOS PERMISOS DE LOS ARCHIVOS" \
		7.MÁS_OPCIONES "MAS OPCIONES Y CONFIGURACIONES" \
		8.REINICIAR_PBX "REINICIAR LA CENTRALITA DESDE LA CONSOLA" \
		9.SALIR-EXIT "SALIR A LA CONSOLA DE COMANDOS" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.VARIABLES)menu_variables;;
		2.GENERAR_EXTENSIONES)MENU_GENERAR;;
		3.CHAR_MANUAL)MENU_CHAR;;
		4.GESTIONA_NOMBRES)MENU_NOMBRES;;
		5.CLI_DE_ASTERISK)MENU_ASTERISK;;
		6.GESTIONA_PERMISOS)F_PERMISOS;;
		7.MÁS_OPCIONES)MENU_MAS;;
		8.REINICIAR_PBX)reboot;;
		9.SALIR-EXIT) clear; break;;
	esac
done

}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
			menu_variables
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█

INFO
#function menu_variables(){
#
# Definimos el loop infinito
#
ver_variables

while true
do

### MUESTRA MENU DE VARIABLES ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - V A R I A B L E S ]" \
	--menu "${MENU_TXT}" 15 75 5 \
		1.VARIABLES "VER VARIABLES" \
		2.EDITAR "EDITA VARIABLES" \
		3.FICHERO "ABRE EL FICHERO DE VARIABLES CON EL EDITOR" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.VARIABLES)ver_variables;;
		2.EDITAR)  edita_variables;;
		3.FICHERO) nano_variables;;
		9.VOLVER) break;;
	esac
done

}
<<INFO #Trasladado al fichero "scripts_variables.sh"
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
			ver Variables.
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█


function ver_variables(){
TEXTO_VARIABLES="Nombre que va delante del numero de Extensión Ej.EXT \n\nINDICE=${INDICE}\n\nExtension de Inicio para el Contador \n\nHABSTART=${HABSTART} \n\nExtension Limite para el contador \n\nLIMIT=${LIMIT} 
\n\nHabitación por defecto para la cabina \n\nROMCAB=${ROMCAB}\n\nNombre que aparecera en la extension de la Cabina \n\nCABINA='${ROMCAB}-CABINA'\n\nFichero de salida donde el Driver del 'CHAR' cargara los nombres en los CheckIn-Out
\n\nSALIDA=${SALIDA}\n\nPassword para la compresion de Audios de llamadas \n\nPASSWORD=${PASSWORD}\n\nRuta de los Ficheros de Actualizacion de los scripts. \n\nFOLDER1=${FOLDER1}\n\nCARPETA=${CARPETA}"
dialog --title "${CTBELL}" --pause "${TEXTO_VARIABLES}" 200 150 55
}
INFO
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█

		█████████████████████
			 MENU_GENERAR
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function MENU_GENERAR(){
#
# Definimos el loop infinito
#
while true
do
### MUESTRA MENU DE GENERAR ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - G E N E R A R ]" \
	--menu "${MENU_TXT}" 20 75 8 \
		1.UN_RANGO "CREA 1 RANGO DE EXTENSIONES" \
		2.VARIOS_RANGOS "CREA VARIOS RANGOS CONSECUTIVOS EN 1 SOLO ARCHIVO" \
		3.EDITA_RANGOS "EDITA ARCHIVO DE RANGOS" \
		4.EXTENSIONES "CREA EXTENSIONES.CSV DESDE ARCHIVO de RANGOS" \
		5.SIP_CUSTOM "CREA 'SIP_CUSTOM_POST.CONF' DESDE ARCHIVO RANGOS" \
		6.SIP_MANUAL "AÑADE '_CUSTOM_POST.CONF' DE FORMA MANUAL" \
		7.SIN_CHAR "CREA 'Checkinout%EXT%.php' _SIN CHAR_ DESDE RANGOS" \
		8.EDITA_EXTENSION "EDITA LA EXTENSION DE TU ELECCIÓN 'checkinout\%extension\%.php'" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.UN_RANGO )clear; echo "UN RANGO"; sleep 5;;
		2.VARIOS_RANGOS) clear; echo "VARIOS RANGOS" ; sleep 5;;
		3.EDITA_RANGOS) clear; echo "EDITA RANGOS" ; sleep 5;;
		4.EXTENSIONES)clear; echo "EXTENSIONES" ; sleep 5;;
		5.SIP_CUSTOM )clear; echo "SIP_CUSTOM_POST" ; sleep 5;;
		6.SIP_MANUAL )clear; echo "SIP_CUSTOM_POST DE MANUAL" ; sleep 5;;
		7.SIN_CHAR)clear; echo "SIN CHAR CREAMOS CHECKINOUT000.PHP" ; sleep 5;;
		8.EDITA_EXTENSION)clear; echo  "EDITA LA EXTENSION DE TU ELECCIÓN 'checkinout\%extension\%.php'"; sleep 5;;
		9.VOLVER) break;;
	esac
done
}

<<INFO

		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		

		█████████████████████
			 MENU_CHAR
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function MENU_CHAR(){
#
# Definimos el loop infinito
#
while true
do

### MUESTRA MENU DE GENERAR ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - C H A R ]" \
	--menu "${MENU_TXT}" 20 80 8 \
		1.TODAS_LIBRES "PASA EL ESTADO DE TOAS LAS EXTESIONES A LIBRES" \
		2.TODAS_OCUPADAS "PASA EL ESTADO DE TOAS LAS EXTESIONES A OCUPADAS" \
		3.INDIVIDUAL_LIBRE "SELECCIOINA LA EXTENSION QUE QUIERES DEJAR LIBRE" \
		4.INDIVIDUAL_OCUPADA "SELECCIOINA LA EXTENSION QUE QUIERES DEJAR OCUPADA" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")

# Śelección de Opciones 
	case $menuitem in
		1.TODAS_LIBRES )clear; echo "PASA EL ESTADO DE TOAS LAS EXTESIONES A LIBRES"; sleep 5;;
		2.TODAS_OCUPADAS  )clear; echo "PASA EL ESTADO DE TOAS LAS EXTESIONES A OCUPADAS" ; sleep 5;;
		3.INDIVIDUAL_LIBRE  )clear; echo "SELECCIOINA LA EXTENSION QUE QUIERES DEJAR LIBRE" ; sleep 5;;
		4.INDIVIDUAL_OCUPADA  )clear; echo "SELECCIOINA LA EXTENSION QUE QUIERES DEJAR LIBRE" ; sleep 5;;
		9.VOLVER) break;;
	esac
done
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲		

		

		█████████████████████
			 MENU NOMBRES
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function MENU_NOMBRES(){
#
# Definimos el loop infinito
#
while true
do
### MUESTRA MENU DE GENERAR ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - N O M B R E S ]" \
	--menu "${MENU_TXT}" 15 90 5 \
		1.NOMBRAR_TODAS "NOMBRA TODAS LAS EXT CON LA VARIABLE NOMBRE Y EL Nº DE EXTENSION" \
		2.VER_NOMBRES "VER LISTA CON TODOS LOS NOMBRES ASIGNADOS A LAS EXTENSIONES" \
		3.EDITARLOS "BORRAR NOMBRE Ó CAMBIARLOS" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.NOMBRAR_TODAS )clear; echo "NOMBRA TODAS LAS EXT CON LA VARIABLE NOMBRE Y EL Nº DE EXTENSION"; sleep 5;;
		2.VER_NOMBRES) clear; echo "VER LISTA CON TODOS LOS NOMBRES ASIGNADOS A LAS EXTENSIONES" ; sleep 5;;
		3.EDITARLOS) clear; echo "BORRAR NOMBRE Ó CAMBIARLOS" ; sleep 5;;
		9.VOLVER) break;;
	esac
done
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲		

		

		█████████████████████
			MENU ASTERISK
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function MENU_ASTERISK(){
#
# Definimos el loop infinito
#
while true
do
### MUESTRA MENU DE GENERAR ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - C L I  A S T E R I S K ]" \
	--menu "${MENU_TXT}" 15 90 6 \
		1.CLI "ABRE LA CONSOLA DE ASTERISK" \
		2.VER_SIP "VER TODAS LAS LINEAS SIP" \
		3.DIALPLAN "RECARGA EL DIALPLAN" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.CLI)clear; asterisk -rvvvvvvvvvvv ; sleep 5;;
		2.VER_SIP) clear; echo "VER TODAS LAS LINEAS SIP" ; sleep 5;;
		3.DIALPLAN) clear; echo "RECARGA EL DIALPLAN" ; sleep 5;;
		9.VOLVER) break;;
	esac
done
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲		

		

		█████████████████████
			MENU MAS
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function MENU_MAS(){
#
# Definimos el loop infinito
#
while true
do
### MUESTRA MENU DE GENERAR ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ M E N U  - M Á S  &  O P C I O N E S ]" \
	--menu "${MENU_TXT}" 25 90 9 \
		1.INICIALIZA "BORRA TODA LA CONFIGURACION DE UNA POSIBLE INSTALACIÓN ANTERIOR" \
		2.EDITA_EXTENSION "ABRE EL EDITOR DE TEXTO CON EL 'Extension_custom.conf'" \
		3.EDITA_SIP_CUSTOM "ABRE EL EDITOR DE TEXTO CON EL 'sip_custom.conf'" \
		4.TIMER "¿?¿?" \
		5.INSERTNAME "??¿" \
		6.ACTUALIZA "FUERZA LA ACTUALIZACION DESDE LA NUBE" \
		7.VNC_INST "INSTALA ENTORNO GRAFICO POR VNC" \
		8.CONF_RED "LANZA EL CONFIGURADOR AUTOMATICO DE RED MANUALMENTE" \
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.CLI)clear; asterisk -rvvvvvvvvvvv ; sleep 5;;
		1.INICIALIZA )clear; echo "BORRA TODA LA CONFIGURACION DE UNA POSIBLE INSTALACIÓN ANTERIOR" ; sleep 5;;
		2.EDITA_EXTENSION )clear; echo  "ABRE EL EDITOR DE TEXTO CON EL 'Extension_custom.conf'" ; sleep 5;;
		3.EDITA_SIP_CUSTOM )clear; echo  "ABRE EL EDITOR DE TEXTO CON EL 'sip_custom.conf'" ; sleep 5;;
		4.TIMER )clear; echo "¿?¿?" ; sleep 5;;
		5.INSERTNAME )clear; echo "??¿" ; sleep 5;;
		6.ACTUALIZA )clear; echo "FUERZA LA ACTUALIZACION DESDE LA NUBE" ; sleep 5;;
		7.VNC_INST )clear; echo "INSTALA ENTORNO GRAFICO POR VNC" ; sleep 5;;
		8.CONF_RED )clear; echo "LANZA EL CONFIGURADOR AUTOMATICO DE RED MANUALMENTE" ; sleep 5;;
		9.VOLVER) break;;
	esac
done
}

<<INFO
█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█
    		FIN DEFINICION DE FUNCIONES


███████████████████████████████████████████████████
 INICIO DEL SCRIPT CON LA LLAMADA A LAS FUNCIONES
█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO

#LANZAMOS LA FUNCION CON EL MENÚ PRINCIPAL
reset
#echo "${BANNER}"
#sleep 1
menu_principal

<<INFO
█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█
	 FIN SCRIPT CON LA LLAMADA A LAS FUNCIONES
███████████████████████████████████████████████████
INFO

# LIMPIEZA DEL SCRIPT
# Si se ha creado archos temporales los eliminamos
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
