#!/bin/bash -   
#Titulo         :openvpncli.sh
#Descripción   :Script para adecuar y adaptar los archivos del cliente de OpenVpn para los Yealink
#Autor          :Elias Nieva
#Fecha          :2020-04-03
#Versión       :0.5    
#uso            :./openvpncli.sh
#Notas          :Creado a partir del Manual de Yealink 
#Notas 2		:(http://support.yealink.com/previewPdf?file=http%3A%2F%2Fsupport.yealink.com%2Fforward2download%3Fpath%3DZIjHOJbWuW%2FDFrGTLnGypjZRKhDplusSymbolXJQ4Plvu8HUaOBNWu7K2dzOc8sOZFtq6m9svydh5plusSymbolqXHdquuysZz8r4jssH3r6jFS7pnYu2fRLGXwYgBPAlucplusSymboljxnAoAMwR3x8hoFbzKenjXmeTtyELSjfgdjg%3D%3D)
#bash_version   :4.3.48(1)-release
#E-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh
if [ -f "$VARIABLE" ]
then
source $VARIABLE
else
	echo "No Encuentro el Archivo de Variables"
	break
fi

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
                        

:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/ctbell/scripts/variables.sh

 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
	# Primera Fase (1)
		#DECLARO VARIABLES PROPIAS DEL SCRIPT EN CUESTIÓN
DEPLO=`cat /etc/schmooze/pbxid`
#echo "$DEPLO.deployments.pbxact.com"
IPPUBLIC=`curl ifconfig.me`

CARPETAOVPN='/opt/CHAR/OpenVpn_Ext'
NOMARCH=$1	#Nombre del Archivo a tratar
NUMEXT=$2	#Numero de Extensión a Tratar
TELEFONOIP=$3 #Ip de la Ext a configurar

clear
echo -e "${Blanco} ------ ASISTENTE DE CREACIÓN PARA ARCHIVOS CLIENTE DE OPENVPN  ------ ${nc}"
echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
echo -e "Primero hay que generar la extensión en la Pbx \ny comprobar que este dado de alta para ${Blanco}OpenVpn Server${nc}"
echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
echo -e "${Purpuraclaro} -  $DEPLO.deployments.pbxact.com  - ${Cyanclaro} - $IPPUBLIC -  ${nc}"
echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
            echo -e "${Blanco}¿Elige la interfaz de red de la centralita en Putty/SSH con la que vas a trabajar? ${nc}"
			echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e "	|	(${Purpuraclaro}Opción 1${nc}) 	| Interfaz [0]:${Cyanclaro} $IP	${nc}"
			echo -e " 	|	(${Purpuraclaro}Opción 2${nc})	| Interfaz [1]:${Cyanclaro} $IP2${nc}"
			echo -e "${Amarillo}-------------------------------------------------------------- ${nc}" 
			select yn in "0" "1"; do
			    case $yn in
			        0 ) echo -e "${Amarillo}-------------------------------------------------------------- ${nc}";break;;
			        1 ) echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"; IP=$IP2;break;;
				    esac
				done
            	
            echo -e "${Blanco}¿Es correcta la | IP:${Amarillo}$IP${Blanco} | para poder gestionar la centralita${nc}"
			select yn in "Si" "No"; do
			    case $yn in
			        Si ) echo -e "${Blanco} OK, seguimos${nc}";break;;
			        No ) echo -e "${Blanco}Salimos y hay que volver a empezar una vez corregido ${nc}";exit;;
				    esac
				done
echo " "
echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
echo -e "Debes descargar el Fichero generado por la pbx de la Extensión que quieras configurar \n entrando en ${Blanco}http://$IP/ucp/ ${nc}con el usuario y el Password asignado en \"${Amarillo}User Manager${nc}\" de la Centralita"
echo -e "y Guardarlo en la Carpeta compartida de Windows ${Amarillo}\"file:\\$IP\ASTCHAR\OpenVpn_Ext\ \" ${nc}"
            
            #echo -e "${Blanco}Introduzca la IP de la Extensión por OpenVpn Configurada \n Ejemplo: ${Amarillo} $VPNIP ${Blanco} en ${nc}"
            #read TELEFONOIP
			
			read -p "Presiona \"Enter\" con el teclado Para Continuar"
	
	<<-! COMENTARIO
		Condicional Existe la carpeta	/opt/CHAR/OpenVpn_Ext
			Si Existe continuo 
				limpio pantalla
				salto al punto 2
			No Existe la Creo 
				limpio pantalla
				Cancelo asistente 
				y recuerdo Descargar el Archivo desde el UCP de la Centralita con enlace y donde debe guardarlo en file://IP/ASTCHAR/OpenVpn_Ext/
	FIN DE COMENTARIO
	!
		if [ -d "$CARPETAOVPN" ] 
		then
			clear
    		echo "La Carpeta $CARPETAOVPN Existe, => Fase 2" 
		else
			clear
    		echo "La Carpeta $CARPETAOVPN No Existe,"
    		echo "Debes descargar el Fichero http://$IP/ucp/ entrando con el usuario y el Password asignado en \"User Manager\" de la Centralita"
    		echo "y Guardarlo en la Carpeta compartida de Windows ${Blanco}\"file:\\$IP\ASTCHAR\OpenVpn_Ext\ \" ${nc} "
    		mkdir /opt/CHAR/OpenVpn_Ext/
    		exit
		fi
echo "---------------------------------------------------------"

	# Segunda Fase (2)

	<<-! COMENTARIO
	    
	    Entro en un Bucle para comprobar los datos hasta que seán correctos.

		    Pregunta (1): ¿Como se llama el archivo que descargo y para que extensión?
			    Variable_1: Nombre de archivo
		        Variable_2: Numero de Extensión

		    Condicional : Comprueba si existe el archivo en la ruta /opt/CHAR/OpenVpn_Ext/
		        Si existe Continuo (Salto al paso 3)
		    
		        No existe Vuelvo al punto a la pregunta (1) avisando que no se encuentra.

     FIN DE COMENTARIO
	!

		valid=true
		i=0
		while [ $valid ]
		do

                if [ -f "$CARPETAOVPN/$NOMARCH.zip" ]
                then
                        clear
                i=1
                echo "El Archivo $NOMARCH.zip Existe => Fase 3"
                break

                else
                        clear
                    i=0
                    ls $CARPETAOVPN/*zip
                    sleep 2
                    echo -e "${Blanco}Escribe el nombre correcto${nc}"
                    echo -e "${Amarillo}El Archivo no se encuentra${nc}"
                    sleep 2
                    
                    echo -e "${Blanco}Introduzca el nombre del Archivo sin la extensión ${nc}\n(Ej: clientX)"
                    echo -e "${Rojoclaro}IMPORTANTE:${Verde}sin el .zip solo clientX)${nc}:"
                    read NOMARCH
                    
                    echo -e "${Amarillo}Introduzca el Numero de la Extensión${nc}"
                    read NUMEXT

                fi
		done
		#echo "Aqui seguimos $i"
	

	# Tercera Fase (3)
	
	<<-! COMENTARIO
		Creo carpeta Temporal 
			(/opt/CHAR/OpenVpn_Ext/Temporal/)

		Creo carpeta "keys"  dentro de la Temporal 
			(/opt/CHAR/OpenVpn_Ext/Temporal/keys)
		
		Descomprimo el Archivo "ZIP" en la carpeta Temporal (/opt/CHAR/OpenVpn_Ext/Temporal/)
				Renombro los archivos internos (EJ: sysadmin_client4.crt) por:
					renombro y Muevo "/opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$VARIABLE_1.crt" por "/opt/CHAR/OpenVpn_Ext/Temporal/keys/client.crt"
					renombro y Muevo "/opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$VARIABLE_1.key" por "/opt/CHAR/OpenVpn_Ext/Temporal/keys/client.key"
					renombro y Muevo "/opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_ca.crt" por "/opt/CHAR/OpenVpn_Ext/Temporal/keys/ca.crt"
					renombro "/opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$VARIABLE_1.conf" por "/opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf"
					
     FIN DE COMENTARIO
	!

		mkdir /opt/CHAR/OpenVpn_Ext/Temporal/
		
		mkdir /opt/CHAR/OpenVpn_Ext/Temporal/keys

		unzip /opt/CHAR/OpenVpn_Ext/$NOMARCH.zip -d /opt/CHAR/OpenVpn_Ext/Temporal/

		mv -f /opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$NOMARCH.crt  /opt/CHAR/OpenVpn_Ext/Temporal/keys/client.crt
		mv -f /opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$NOMARCH.key /opt/CHAR/OpenVpn_Ext/Temporal/keys/client.key
		mv -f /opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_ca.crt /opt/CHAR/OpenVpn_Ext/Temporal/keys/ca.crt
		mv -f /opt/CHAR/OpenVpn_Ext/Temporal/sysadmin_$NOMARCH.conf /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf

	# Cuarta Fase (4)

	<<-! COMENTARIO
	
		Borro Archivo "vpn.cnf" e inserto mis datos genericos.

     FIN DE COMENTARIO
	!
	
			echo "#" > /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "# Configuración generada automaticamente por Script $NOMARCH para la Extensión $NUMEXT"   > /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "# Generado para la PBX $HOSTNAME 	"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "# Generado el: ($FECHA $HORA) "   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "client"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "dev tun"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "proto udp"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "resolv-retry 60"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "nobind"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "persist-key"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "persist-tun"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "remote-cert-tls server"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "ca /config/openvpn/keys/ca.crt"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "cert /config/openvpn/keys/client.crt"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "key /config/openvpn/keys/client.key"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "comp-lzo"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "verb 3"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			echo "reneg-sec 3600"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf
			# IMPORTANTE PREGUNTAR IP O DDns y Puerto remote 40717488.deployments.pbxact.com 50594
                    clear
                    echo " ----- INTRODUCIR DDNS o IP MÁS EL PUERTO ------"
                    echo -e "Introduzca el nombre de DDNS \n(Ej:${Amarillo} -$DEPLO.deployments.pbxact.com-  )${nc}"
                    echo -e "o la IP Publica si es Estatica (Ej:${Amarillo} -$IPPUBLIC-  )${nc}"
                    echo -e "{Rojoclaro}IMPORTANTE:Esto se puede conseguir en la Interfaz Web de la Centralita en: \n ADMIN=>Administrador del Sistema => DDNS \"\" ${nc}:"
                    read DDNSoIP
                    
                    echo -e "Introduzca el Numero del Puerto Externo de OpenVpn Configurado en el NAT del Router\n Ejemplo: Interno 1194 ==NAT==> Externo 50594 "
                    read PORT

			echo "remote $DDNSoIP $PORT"   >> /opt/CHAR/OpenVpn_Ext/Temporal/vpn.cnf

	# Quinta Fase (5)

		#Comprimo todos los archivos generados en Formato "TAR"
			cd /opt/CHAR/OpenVpn_Ext/Temporal
			tar -cvpf openvpn_$NUMEXT.tar *
			mv -f openvpn_$NUMEXT.tar /opt/CHAR/OpenVpn_Ext/
			cd /opt/CHAR/OpenVpn_Ext/

		# Borro todos los temporales.
			rm -fr /opt/CHAR/OpenVpn_Ext/Temporal/
			rm -fr /opt/CHAR/OpenVpn_Ext/$NOMARCH*

	# Ultima Fase

		# Aviso que esta listo el Archivo en la ruta de Smb smb:///ASTCHAR/OpenVpn_Ext/openvpn_$VARIABLE2.tar
		# Para poder cargarla en el Telefono .
VPNIP=`cat /etc/openvpn/ccd/$NOMARCH | cut -d " " -f2`
			
		clear
		echo -e "${Blanco} ------ ASISTENTE DE CREACIÓN PARA ARCHIVOS CLIENTE DE OPENVPN  ------ ${nc}"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e "                  ${Blanco}Instrucciones del Telefono ${nc}"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"		
			echo -e "	- 1º Configurar la Cuenta del Telefono con la Ip de la Centralita por la VPN"
			echo -e "	- ${Amarillo}EJ: Extension ${Blanco}$NUMEXT${Amarillo} IP:${Blanco}10.8.0.1${Amarillo} al PUERTO: ${Blanco}4399 ${nc}"
			echo -e "	 "
			echo -e "http://IP_del_Telefono/ ==> Cuenta ==> Numero de Cuenta ==> Registro"
			echo -e "	Cuenta"		
			echo -e "		Línea activa	HABILITADO/DESHABILITADO"
			echo -e "		Etiqueta ==> $NUMEXT"
			echo -e "		Mostrar nombre ==> $NUMEXT"	
			echo -e "		Nombre de registro ==> $NUMEXT"
			echo -e "		Usuario ==> $NUMEXT"
			echo -e "		Contraseña ==> $NUMEXT.aaa!$NUMEXT"
			echo -e "	Servidor SIP 1"
			echo -e "		Host de servidor ==> 	10.8.0.1	PUERTO  ==> 4399"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"			
			read -p "Presiona \" Enter \" con el teclado Para Continuar"
		clear
		echo -e "${Blanco} ------ ASISTENTE DE CREACIÓN PARA ARCHIVOS CLIENTE DE OPENVPN  ------ ${nc}"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e "                  ${Blanco}Instrucciones del Telefono ${nc}"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e "	-El Archivo esta listo para descargar en su pc desde la ubicación:"
			echo -e "	- ${Amarillo}file:\\$IP\ASTCHAR\OpenVpn_Ext\openvpn_$NUMEXT.tar${nc}"
			echo -e "	- Debe Acceder al Telefono ${Blanco}Yealink ${nc}por administrración Web"
			echo -e "	- Entrar en la Configuracion de ${Amarillo}Red / Avanzado. ${nc}"
			echo -e "	- Al Final del todo buscar la sección \"${Blanco} VPN ${nc} \" "
			echo -e "	- Cargar el Archivo ${Blanco} openvpn_$NUMEXT.tar ${nc} dandole al Botón \"Explorar \""
			echo -e "	- Una vez Cargado Seleccionar ${Blanco} \"HABILITADO\"${nc} En la Pestaña ${Blanco} Activo ${nc}"
			echo -e "	- Esto Reiniciara el Telefono, si todo ha ido bien una vez reiniciado Aparecera un simbolo de VPN en el Telefono"
			echo -e "	  y deberas poder hacer ping desde la Centralita por CLI al Telefono con su IP de la VPN "
			echo -e "     ${Amarillo}$VPNIP${nc}según la configuracion de la Extensión"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e " "
			echo -e "Una Vez cargado el Archivo en el Telefono continua para hacer la prueba que todo vaya bien.	 "
			read -p "Presiona \" Enter \" con el teclado Para Continuar"
			echo -e " -------------${Amarillo} ESPERA A QUE SE REINICIE EL TELEFONO 30segundos${nc}---------------"
			sleep 30
			ping $VPNIP -c 5
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
			echo -e "                    ${Blanco}FINALIZADO ${nc}"
		echo -e "${Amarillo}-------------------------------------------------------------- ${nc}"
		sleep 3