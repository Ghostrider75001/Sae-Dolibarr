#!/bin/bash

# Nom des volumes
DB_VOLUME="db_data"
DOLIBARR_VOLUME="dolibarr_data"

# Date pour le nom du fichier de sauvegarde
DATE=$(date +%Y%m%d_%H%M)

# Sauvegarde de la base de données
echo "Sauvegarde de la base de données..."
docker run --rm --volumes-from $DB_VOLUME -v $(pwd):/backup alpine \
  sh -c "mysqldump -u root -p'$DB_ROOT_PASSWORD $DB_NAME' > /backup/db_backup_$DATE.sql"

echo " "

# Sauvegarde des fichiers Dolibarr
echo "Sauvegarde des fichiers Dolibarr..."
docker run --rm --volumes-from $DOLIBARR_VOLUME -v $(pwd):/backup alpine \
  sh -c "tar cvzf /backup/dolibarr_backup_$DATE.tar.gz /var/www/html"

echo "Sauvegarde terminée."