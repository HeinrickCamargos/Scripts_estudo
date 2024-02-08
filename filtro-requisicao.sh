#!/bin/bash

#      __    __
#     / /__ / /  ___ ___ ___ _
#    /  '_// _ \/ -_|_-</ _ `/
#   /_/\_\/_.__/\__/___/\_,_/
#
#########################################
#

cd /home/kbesa/log/

if [ -z $1 ]
then
        while [ -z $requisicao ]
        do
                read -p "Informar o parametro que deseja (GET,PUT,POST,DELETE): " requisicao
                letra_maiscula=$(echo $requisicao | awk '{ print toupper($1) }')
        done

else
        letra_maiscula=$(echo $requisicao | awk '{ print toupper($1) }')
fi

case $letra_maiscula in
        GET)
        cat apache.log | grep GET
        ;;
        PUT)
        cat apache.log | grep PUT
        ;;
        POST)
        cat apache.log | grep POST
        ;;
        DELETE)
        cat apache.log | grep DELETE
        ;;

esac

