#!/bin/bash

# Passo 1: Acessar o diretório /opt
echo "Acessando /opt..."
cd /opt || { echo "Erro ao acessar /opt"; exit 1; }

# Passo 2: Criar pasta 'script' e entrar nela
echo "Criando diretório 'script'..."
mkdir -p script && cd script || { echo "Erro ao criar/acessar /opt/script"; exit 1; }

# Passo 3: Criar o arquivo elastic.sh com o conteúdo do script de serviços
echo "Criando arquivo elastic.sh..."
cat << 'EOF' > elastic.sh
#!/bin/bash

# Reiniciar os serviços do Elastic Stack
echo "Reiniciando Metricbeat..."
sudo systemctl restart metricbeat.service

echo "Reiniciando Filebeat..."
sudo systemctl restart filebeat.service

echo "Reiniciando Auditbeat..."
sudo systemctl restart auditbeat.service

echo "Todos os serviços foram reiniciados com sucesso!"
EOF

# Passo 4: Tornar o script executável
echo "Tornando elastic.sh executável..."
chmod +x elastic.sh

# Passo 5: Executar o script elastic.sh
echo "Executando o script elastic.sh..."
./elastic.sh
