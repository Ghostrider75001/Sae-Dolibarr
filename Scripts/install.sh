#!/bin/bash

# Variables
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Mise à jour du système
echo "Mise à jour du système..."
apt-get update && apt-get upgrade -y

# Vérifie si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Installation de Docker..."
    apt-get install -y docker.io
    systemctl start docker
    systemctl enable docker
fi

# Vérifie si Docker Compose est installé
if ! command -v docker compose &> /dev/null; then
    echo "Docker Compose n'est pas installé. Installation de Docker Compose..."
    apt-get install -y docker compose
    groupadd docker
    usermod -aG docker $USER
    newgrp docker
fi

# Installation de Docker
# echo "Installation de Docker..."
# apt-get install -y docker.io docker-compose

# Crée un répertoire pour Dolibarr
# mkdir -p ~/dolibarr
# cd ~/dolibarr

# Création du fichier docker-compose.yml
cat <<EOL > $DOCKER_COMPOSE_FILE
services:
    mariadb:
        image: mariadb:latest
        environment:
            MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD:-root}
            MYSQL_DATABASE: ${MYSQL_DATABASE:-dolidb}
            MYSQL_USER: ${MYSQL_USER:-dolidbuser}
            MYSQL_PASSWORD: ${MYSQL_PASSWORD:-dolidbpass}
        container_name: mariadb

    web:
        image: dolibarr/dolibarr:latest
        environment:
            WWW_USER_ID: ${WWW_USER_ID:-1000}
            WWW_GROUP_ID: ${WWW_GROUP_ID:-1000}
            DOLI_DB_HOST: ${DOLI_DB_HOST:-mariadb}
            DOLI_DB_NAME: ${DOLI_DB_NAME:-dolidb}
            DOLI_DB_USER: ${DOLI_DB_USER:-dolidbuser}
            DOLI_DB_PASSWORD: ${DOLI_DB_PASSWORD:-dolidbpass}
            DOLI_URL_ROOT: "${DOLI_URL_ROOT:-http://0.0.0.0}"
            DOLI_ADMIN_LOGIN: "${DOLI_ADMIN_LOGIN:-admin}"
            DOLI_ADMIN_PASSWORD: "${DOLI_ADMIN_PASSWORD:-admin}"
            DOLI_CRON: ${DOLI_CRON:-0}
            DOLI_INIT_DEMO: ${DOLI_INIT_DEMO:-0}
            DOLI_COMPANY_NAME: ${DOLI_COMPANY_NAME:-MyBigCompany}

        ports:
            - "80:80"
        links:
            - mariadb
EOL

# Lancement de Docker Compose
echo "Démarrage de l'application Dolibarr..."
docker compose up -d

# Vérification du statut des conteneurs
echo "Vérification du statut des conteneurs..."
docker compose ps

echo "Installation de Dolibarr et du SGBD terminée."
echo "Dolibarr est accessible à l'adresse http://localhost:80"
