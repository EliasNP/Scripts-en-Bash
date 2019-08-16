IP=`hostname -I`
tmsg "ENTORNO GRAFICO POR VNC por $IP:5901 ACTIVADO"
firefox http://$IP &
