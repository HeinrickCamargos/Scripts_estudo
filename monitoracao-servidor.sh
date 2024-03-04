#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://192.168.9.35)

if [ $resposta_http -ne 200 ]
then
        echo "Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo, favor verificar." | msmtp -a gmail heinrickcomunix@gmail.com
        systemctl restart apache2
fi
