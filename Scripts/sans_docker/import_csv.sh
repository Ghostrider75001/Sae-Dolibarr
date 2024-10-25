#!/bin/bash

# Variables
DB_HOST="localhost"
DB_USER="root"
DB_PASSWORD="Password"
DB_NAME="dolibarr"

# Chemin vers les fichiers CSV
CLIENTS_CSV="clients.csv"
FOURNISSEURS_CSV="fournisseurs.csv"

# Si jamais vous vous mettre vos clients et fournisseurs dans la même TABLE
# il faut definir alors des types d'identités
# Pour cela :
# SET type = 'client';  # Définit le type comme 'client'
# SET type = 'fournisseur';  # Définit le type comme 'fournisseur'

echo "Creation des TABLES clients et fournisseurs..."
mysql -u root -p'Password' dolibarr -e "CREATE TABLE clients (
    nom VARCHAR(50),
    email VARCHAR(100),
    telephone VARCHAR(15)
);"

mysql -u root -p'Password' dolibarr -e "CREATE TABLE fournisseurs (
    nom VARCHAR(50),
    email VARCHAR(100),
    telephone VARCHAR(15)
);"
echo "Creation des TABLES terminées."

# Importation des clients
if [ -f "$CLIENTS_CSV" ]; then
    echo "Importation des clients à partir de $CLIENTS_CSV..."
    mysql -u root -p'Password' dolibarr -e "
    LOAD DATA LOCAL INFILE '$CLIENTS_CSV'
    INTO TABLE clients
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (nom, email, telephone)
    "
else
    echo "Fichier $CLIENTS_CSV non trouvé. Veuiller le déplacer dans le même repertoire du script ou en crée un avec un format (nom, email, telephone)"
fi

# Importation des fournisseurs
if [ -f "$FOURNISSEURS_CSV" ]; then
    echo "Importation des fournisseurs à partir de $FOURNISSEURS_CSV..."
    mysql -u root -p'Password' dolibarr -e "
    LOAD DATA LOCAL INFILE '$FOURNISSEURS_CSV'
    INTO TABLE fournisseurs
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (nom, email, telephone)
    "
else
    echo "Fichier $FOURNISSEURS_CSV non trouvé. Veuiller le déplacer dans le même repertoire du script ou en crée un avec un format (nom, email, telephone)"
fi

echo "Importation terminée."