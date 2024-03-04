#!/bin/bash

#      __    __
#     / /__ / /  ___ ___ ___ _
#    /  '_// _ \/ -_|_-</ _ `/
#   /_/\_\/_.__/\__/___/\_,_/
#
#########################################

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print$3  }')
relacao_memoria_atual_total=$(bc <<< "scale=2;memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $relacao_memoria_atual_total -gt 50 ]
then

        echo "Consumo de memoria acima do limite" | msmtp -a gmail heinrickcomunix@gmail.com
fi
