#!/bin/bash

# Variables
DB_ROOT_PASSWORD="root"
DB_NAME="dolibarr"
DB_USER="dolibarr_user"
DB_PASSWORD="root"
DOLIBARR_VERSION="18.0.2" # Remplacez par la dernière version stable si nécessaire
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
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose n'est pas installé. Installation de Docker Compose..."
    apt-get install -y docker-compose
fi

# Installation de Docker
# echo "Installation de Docker..."
# apt-get install -y docker.io docker-compose

# Crée un répertoire pour Dolibarr
# mkdir -p ~/dolibarr
# cd ~/dolibarr

# Création du fichier docker-compose.yml
cat <<EOL > $DOCKER_COMPOSE_FILE
version: '3.8'

services:
  database:
    image: mysql:latest
    restart: no
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
      MYSQL_DATABASE: $DB_NAME
      MYSQL_USER: $DB_USER
      MYSQL_PASSWORD: $DB_PASSWORD
    volumes:
      - db_data:/var/lib/mysql

  dolibarr:
    image: dolibarr/dolibarr:$DOLIBARR_VERSION
    restart: no
    ports:
      - "8080:80"
    environment:
      DB_HOST: database
      DB_NAME: $DB_NAME
      DB_USER: $DB_USER
      DB_PASSWORD: $DB_PASSWORD
    volumes:
      - dolibarr_data:/var/www/html

volumes:
  db_data:
  dolibarr_data:
EOL

# Lancement de Docker Compose
echo "Démarrage de l'application Dolibarr..."
docker-compose up -d

# Vérification du statut des conteneurs
echo "Vérification du statut des conteneurs..."
docker-compose ps

echo "Installation de Dolibarr et du SGBD terminée."
echo "Dolibarr est accessible à l'adresse http://localhost:8080"