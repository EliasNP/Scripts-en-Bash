#!/bin/bash -   
#Titulo         :instascript.sh
#Descripción   :Script automatizado de descarga e instalacion de Actualizaciones y Scripts de CtBell para gestión automatizada
#Autor          :Elías Nieva Prieto
#Fecha          :2020-01-02
#Versión       :B0.0b0A.01
#uso            :./instascript.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
#E-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

FOLDER2=scripts
# Variables de Habitaciones cargadas desde el Script "Variables.sh"
VARIABLE=~/$FOLDER2/variables.sh
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
Amarillo Azul Azulclaro banner Blanco CABINA CARPETA Cyan Cyanclaro FOLDER1 Grisclaro Grisoscuro HAB9 HABSTART INDICE LIMIT Marron nc Negro PASSWORD printf Purpura Purpuraclaro Rojo Rojoclaro ROMCAB ROOTSCRIPT SALIDA trap URL URL1 VER Verde Verdeclaro 
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
if [ -d "$HOME/$FOLDER2" ]
                then
                        echo "-------------------------------------------------------"
                        echo "$HOME/$FOLDER2/ Encontrada, podemos seguir actualizando." 
                        echo "-------------------------------------------------------"
                        mv -f $HOME/$FOLDER2/ $HOME/$HORA-$FOLDER2.-BAK ## Creo copia de lo antiguo backup 
                        echo "BackUp creado en $HOME/$HORA-$FOLDER2.-BAK" 
                else
                        echo "No existe la Carpeta"
                fi
echo "Creando Carpeta $HOME/$FOLDER2 Nueva"
mkdir $HOME/$FOLDER2
sleep 5
wget -P $HOME/$FOLDER2 -N http://radius.ctbell.com/ctbell/variables.sh
wget -P $HOME/$FOLDER2 -N http://radius.ctbell.com/ctbell/updatespt.sh
echo "Descargando archivos necesarios"
chmod +x $HOME/$FOLDER2/*.sh
echo "Dandole permisos a los archivos"
echo "Se va a ejecutar el Instalador de Scripts"
 i=10
       	until [ $i -lt 0 ]
            do
		clear
		echo "Creando Carpeta $HOME/$FOLDER2 Nueva"		
		echo "Descargando archivos necesarios"		
		echo "Se va a ejecutar el Instalador de Scripts"
                echo -e "\033[1;33m Vamos a empezar en \033[0m $i \033[1;33m Pulsa \" Ctrl+C \" Para cancelar\033[0m"
                    sleep 1
		 clear
          	((i--))
        done
$HOME/$FOLDER2/updatespt.sh
echo "Scripts Instalados y Demonios en ejecución"
sleep 5 

echo -e "${blue}¿Quieres instalar Servidor de LDAP?${nc}"
while true; do
    read -p "Y/y ó N/n :>>" yn
    case $yn in
        [Yy]* ) sleep 1 ; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor, elige 'Y/y' o 'N/n'.";;
    esac
done

yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
chkconfig slapd on
service slapd start
netstat -antup |  grep -i 389
SLAPPASSW=slappasswd -h {SSHA} -s admin54321ldap
echo "Copia la Clave slap password completa para insertarla a continuación $SLAPPASSW"
cd /etc/openldap/slapd.d/

############db.ldif###################
echo "dn: olcDatabase={2}bdb,cn=config" >> db.ldif
echo "changetype: modify" >> db.ldif
echo "replace: olcSuffix" >> db.ldif
echo "olcSuffix: dc=pbxctbell,dc=local" >> db.ldif
echo "" >> db.ldif
echo "dn: olcDatabase={2}bdb,cn=config" >> db.ldif
echo "changetype: modify" >> db.ldif
echo "replace: olcRootDN" >> db.ldif
echo "olcRootDN: cn=ldapadm,dc=pbxctbell,dc=local" >> db.ldif
echo "" >> db.ldif
echo "dn: olcDatabase={2}bdb,cn=config" >> db.ldif
echo "changetype: modify" >> db.ldif
echo "replace: olcRootPW" >> db.ldif
echo "olcRootPW: $SLAPPASSW" >> db.ldif
############db.ldif###################
echo "Comprueba el Fichero nano db.ldif"
sleep 3 
nano db.ldif
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif

############monitor.ldif###################
echo "dn: olcDatabase={1}monitor,cn=config" >> monitor.ldif
echo "changetype: modify" >> monitor.ldif
echo "replace: olcAccess" >> monitor.ldif
echo "olcAccess: {0}to * by dn.base=\"gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth\" read by dn.base=\"cn=ldapadm,dc=pbxctbell,dc=local\" read by * none" >> monitor.ldif

############monitor.ldif###################
echo "Comprueba el Fichero nano monitor.ldif"
sleep 3 
nano monitor.ldif
ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap:ldap /var/lib/ldap/*

############base.ldif###################
echo "dn: dc=pbxctbell,dc=local" >> base.ldif
echo "dc: pbxctbell" >> base.ldif
echo "objectClass: top" >> base.ldif
echo "objectClass: domain" >> base.ldif
echo "" >> base.ldif
echo "dn: cn=ldapadm ,dc=pbxctbell,dc=local" >> base.ldif
echo "objectClass: organizationalRole" >> base.ldif
echo "cn: ldapadm" >> base.ldif
echo "description: LDAP Manager" >> base.ldif
echo "" >> base.ldif
echo "dn: ou=People,dc=pbxctbell,dc=local" >> base.ldif
echo "objectClass: organizationalUnit" >> base.ldif
echo "ou: People" >> base.ldif
echo "" >> base.ldif
echo "dn: ou=Group,dc=pbxctbell,dc=local" >> base.ldif
echo "objectClass: organizationalUnit" >> base.ldif
echo "ou: Group" >> base.ldif
############base.ldif###################
echo "Comprueba el Fichero nano monitor.ldif"
sleep 3 
nano base.ldif

 i=5
        until [ $i -lt 0 ]
            do
                clear
		echo "#*- El comando Ldapadd nos va a preguntar por el Password de \"ldapadm\" puesto al principio (admin54321ldap)-*#"
                echo -e "\033[1;33m Vamos a empezar en \033[0m $i \033[1;33m Pulsa \" Ctrl+C \" Para cancelar\033[0m"
                    sleep 1
                 clear
                ((i--))
        done

ldapadd -x -W -D "cn=ldapadm,dc=pbxctbell,dc=local" -f base.ldif
