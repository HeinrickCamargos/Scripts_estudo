#!/bin/bash

#      __    __
#     / /__ / /  ___ ___ ___ _
#    /  '_// _ \/ -_|_-</ _ `/
#   /_/\_\/_.__/\__/___/\_,_/
#
#########################################

#
# OBS: esse Script vai monitorar a memoria do servidor e verificar se ela está consumindo demais, caso sim ela ira enviar um email para a conta cadastrada no script. 
#

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print$3  }')
relacao_memoria_atual_total=$(bc <<< "scale=2;memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_memoria_atual_total -gt 50 ]
then
# Neste trecho que será enviado o email.
        echo "Consumo de memoria acima do limite" | msmtp -a gmail heinrickcomunix@gmail.com 
fi
