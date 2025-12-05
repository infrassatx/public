#!/bin/bash

echo "============================"
echo " Atualizando lista de pacotes "
echo "============================"
apt-get update && apt-get upgrade -y
echo "✔ Atualização concluída"
echo

echo "============================"
echo " Executando dist-upgrade "
echo "============================"
apt-get dist-upgrade -y
echo "✔ Dist-upgrade concluído"
echo

echo "============================"
echo " Instalando net-tools "
echo "============================"
apt install -y net-tools
echo "✔ net-tools instalado"
echo

echo "============================"
echo " Instalando Redis "
echo "============================"
apt install -y redis-server
echo "✔ Redis instalado"
echo

echo "============================"
echo " Habilitando Redis na inicialização "
echo "============================"
systemctl enable redis
echo "✔ Redis configurado para iniciar automaticamente"
echo

echo "============================"
echo " Processo concluído! "
echo "============================"
