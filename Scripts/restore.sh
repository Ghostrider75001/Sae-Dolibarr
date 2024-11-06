#!/bin/bash

# Variables
DB_NAME="dolibarr"
DB_USER="root"
DB_PASS="root"
SQL_FILE="Fichier_sql.sql" # Chemin absolue de préference

# Vérifie si le fichier SQL existe
if [ ! -f "$SQL_FILE" ]; then
    echo "Le fichier $SQL_FILE n'existe pas. Veuillez vérifier le chemin."
    exit 1
fi

# Importation des données dans la base de données
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$SQL_FILE"

# Vérifie si l'importation a réussi
if [ $? -eq 0 ]; then
    echo "Données importées avec succès dans la base de données $DB_NAME."
else
    echo "Échec de l'importation des données."
fi
