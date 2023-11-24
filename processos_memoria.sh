#!/bin/bash

#
#        /''''''''''''''''\
#       /''''''''''''''''''\
#      '                    |
#     |        ´´´´    ´´´´´
#    /'\           0    \0  |
#   |                    \  |
#    \_|               \__) |
#      |                    |
#      |       \________/   |
#       \_________ ________/
#            ____| |_____
#          / |    V     |\
#      __    __
#     / /__ / /  ___ ___ ___ _
#    /  '_// _ \/ -_|_-</ _ `/
#   /_/\_\/_.__/\__/___/\_,_/
#
#########################################
#

if [ ! -d log ]
then
        mkdir logs
fi

processos_memoria(){

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
        nome_processo=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S,) >> /home/kbesa/scripts/logs/$nome_processo.log
        tamanho_processo=$(ps -p $pid -o size | grep [0-9])
        echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> /home/kbesa/scripts/logs/$nome_processo.log
done
}

processos_memoria
if [ $? -eq 0 ]
then
        echo "OS ARQUIVOS FORAM SALVOS COM SUCESSO"
else
        echo "HOUVE UM PROBLEMA NA HORA DE SALVAR OS ARQUIVOS"
fi
