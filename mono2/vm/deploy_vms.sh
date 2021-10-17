#!/bin/bash

# Script para instalação + inicialização dos serviços e aplicativos por meio do ANSIBLE.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=deploy_vms

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA=30
LOCALIZACAO_HOSTS="/home/dev/.ssh/known_hosts"
SUITECRM_FILE="./ansible/suitecrm.yml"
MARIADB_FILE="./ansible/mariadb.yml"
HOSTS_FILE="./ansible/hosts"

#COMEÇO DO SCRIPT

echo "Começo do scrpit $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "Remoção de arquivos de HOST de SSH em: $LOCALIZACAO_HOSTS:  $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
rm -f $LOCALIZACAO_HOSTS

echo "Removido arquivo, tempo de espera de ($TEMPO_DE_ESPERA_RAPIDO) para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INICIALIZAÇÃO DO DEPLOY DO APP_SUITECRM ATRAVÉS DO ANSIBLE: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

ansible-playbook ./ansible/suitecrm.yml -i ./ansible/hosts  2>&1>> $LOCALIZACAO_LOGS 

echo "App instalado + inicializado, tempo de espera de para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep $TEMPO_DE_ESPERA

echo "INICIALIZAÇÃO DO DEPLOY DO APP_MARIADB ATRAVÉS DO ANSIBLE: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/mariadb.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

echo "App instalado + inicializado, tempo de espera de para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep $TEMPO_DE_ESPERA

echo "Finalização do $SCRIPT_NOME, serviços disponíveis em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 