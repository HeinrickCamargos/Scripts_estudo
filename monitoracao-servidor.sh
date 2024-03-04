#!/bin/bash

#      __    __
#     / /__ / /  ___ ___ ___ _
#    /  '_// _ \/ -_|_-</ _ `/
#   /_/\_\/_.__/\__/___/\_,_/
#
#########################################

#
# OBS: esse Script tem a função de restart o servidor de apache caso o mesmo esteja fora, porem ele vai disparar um email para o ADM, o sinalizando que o servidor tinha caido. Lembrando que ele so vai ser acionado pelo crontab
#

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://192.168.9.35)

if [ $resposta_http -ne 200 ]
then
# Neste trecho que será enviado o email.
        echo "Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo, favor verificar." | msmtp -a gmail heinrickcomunix@gmail.com
        systemctl restart apache2
fi
