#!/bin/bash

# Variables
DB_HOST="mariadb"
DB_USER="mariadbuser"
DB_PASSWORD="mariadbpass"
DB_NAME="dolidb"

# Chemin vers le fichier CSV
GROUP_CSV="./clients.csv"

# Importation des clients
if [ -f "$GROUP_CSV" ]; then
    echo "Importation des clients à partir de $GROUP_CSV..."
    mariadb -h $DB_HOST -u $DB_USER -p'$DB_PASSWORD' $DB_NAME -e "
    LOAD DATA LOCAL INFILE '$GROUP_CSV'
    INTO TABLE llx_usergroup
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (rowid,nom,entity,datec,tms,note,model_pdf)
    "
else
    echo "Fichier $GROUP_CSV non trouvé. Veuiller le déplacer dans le même repertoire du script ou en crée un avec un format (nom, email, telephone)"
fi

echo "Importation terminée."