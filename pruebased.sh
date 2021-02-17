#!/bin/bash -   
#Titulo         :tikets.sh
#Descripción   :Crea maneja y modifica tikets y sus respuestas
#Autor          :Elias Nieva
#Fecha          :2020-08-10
#Versión       :0.1    
#uso            :./tikets.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
#E-mail         :nombre@servidor.com
#Empresa        :NOMBRE DE LA EMPRESA
#Telefono       :666 999 999
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

cat /home/enieva/Documentos/INFORMATICO/TIKETS/CTBELL_INTERNO/20200901165300.txt
sed -i 's/NUEVO/FINALIZADO/g' /home/enieva/Documentos/INFORMATICO/TIKETS/CTBELL_INTERNO/20200901165300.txt
echo "------------------------------------"
cat /home/enieva/Documentos/INFORMATICO/TIKETS/CTBELL_INTERNO/20200901165300.txt
echo "------------------------------------"
cat  ~/Rpositorios/Documentos/TIKETS.md
sed -i '/20200901165300/s/NUEVO/FINALIZADO/' ~/Rpositorios/Documentos/TIKETS.md
echo "------------------------------------"
cat  ~/Rpositorios/Documentos/TIKETS.md
