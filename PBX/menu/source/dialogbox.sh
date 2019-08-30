#!/bin/bash
dialog --inputbox "What is your username?" 0 0 2> /tmp/inputbox.tmp.$$
retval=$?
input=`cat /tmp/inputbox.tmp.$$`
#rm -f /tmp/inputbox.tmp.$$

case $retval in
0)
echo "Your username is '$input'";;
1)
echo "Cancel pressed.";;
esac
