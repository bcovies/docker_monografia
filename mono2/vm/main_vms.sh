#!/bin/bash

# Script para instalação + inicialização dos serviços e aplicativos por meio do ANSIBLE.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=main_vms

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA=30
TEMPO_DE_LONGO=120
#COMEÇO DO SCRIPT DE BUILD + DEPLOY DAS MÁQUINAS VIRTUAIS

echo "Começo do script $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "Inicio do build em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
./create_vms.sh 

echo "Inicio do deploy em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
./deploy_vms.sh

sleep 300

echo "FINALIZADO ZABBIX"