#!/bin/bash
#
##############################################################################
# Criado por: Heinrick Camargos                                              #
# Comunix Tecnologia                                                         #
# Data: 21/11/2023                                                           #
# Contato:                                                                   #
#         https://www.linkedin.com/in/heinrick-camargos-a505bb222/           #
#         https://github.com/HeinrickCamargos                                #
#                                                                            #
##############################################################################
#
#
##############################################################################
#                                                                            #
#         DESCRIÇÃO:                                                         #
#                                                                            #
#      Esse projeto e somente um estudo pessoal, onde estou convertendo      #
# imagens .jpg para .png e mostrando se o projeto salvou com exito.          #
#                                                                            #
##############################################################################
#
#
################################################################################

# BOAS PRÁTICAS:

# VARIÁVEIS GLOBAIS DEVEM SER DECLARADAS COM LETRAS MAIÚSCULAS

# VARIÁVEIS DEVEM TER NOMES CLAROS COMO POR EXEMPLO: "PID_DO_PROCESSO"

# FUNÇÕES DEVEM SER DECLARADAS COM LETRAS minúsculas

# FUNÇÕES DEVEM TER NOMES CLAROS COMO POR EXEMPLO: "localiza_arquivo"

# COMENTÁRIOS SÃO SEMPRE BEM VINDOS.

# Lembre-se, manter uma boa prática ajuda na manutenção e leitura do código.

################################################################################


converte_imagem(){
        local caminho_imagem=$1
        local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio(){
        cd $1
        for arquivo in *
        do
                local caminho_arquivo=$(find /home/kbesa/imagens/imagens-novos-livros -name $arquivo)
                if [ -d $caminho_arquivo ]
                then
                        varrer_diretorio $caminho_arquivo
                else
                        converte_imagem $caminho_arquivo
                fi
        done
}

varrer_diretorio /home/kbesa/imagens/imagens-novos-livros
if [ $? -eq 0 ]
        then
                echo "CONVERSAO REALIZADA COM SUCESSO"
        else
                echo "HOUVE UM ERRO NO PROCESSO"
fi
