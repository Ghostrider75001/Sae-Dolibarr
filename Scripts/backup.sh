#!/bin/bash

# Variables
DB_CONTAINER_NAME="mariadb"
DB_USER="dolidbuser"
DB_PASSWORD="dolidbpass"
DB_NAME="dolidb"
HOST_DUMP_DIR="./backup"
DUMP_FILE="${DB_NAME}_$(date +%F).sql"

# Cree le dossier si il n'existe pas
mkdir -p $HOST_DUMP_DIR

# Dump la db dans la machine hote
docker exec -i $DB_CONTAINER_NAME \
    mariadb-dump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$HOST_DUMP_DIR/$DUMP_FILE"

if [ $? -eq 0 ]; then
  echo "Database dump completed successfully: $HOST_DUMP_DIR/$DUMP_FILE"
else
  echo "Error: Failed to export SQL dump."
  exit 1
fi
