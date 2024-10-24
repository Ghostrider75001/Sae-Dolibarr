#!/bin/bash

# Variables
DB_HOST="database"
DB_USER="dolibarr_user"
DB_PASSWORD="root"
DB_NAME="dolibarr"

# Chemin vers les fichiers CSV
CLIENTS_CSV="./clients.csv"
FOURNISSEURS_CSV="./fournisseurs.csv"

# Si jamais vous vous mettre vos clients et fournisseurs dans la même TABLE
# il faut definir alors des types d'identités
# Pour cela :
# SET type = 'client';  # Définit le type comme 'client'
# SET type = 'fournisseur';  # Définit le type comme 'fournisseur'

# Importation des clients
if [ -f "$CLIENTS_CSV" ]; then
    echo "Importation des clients à partir de $CLIENTS_CSV..."
    mysql -h $DB_HOST -u $DB_USER -p'$DB_PASSWORD' $DB_NAME -e "
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
    mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME -e "
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