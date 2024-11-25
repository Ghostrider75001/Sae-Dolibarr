#!/bin/bash

# Variables
DB_CONTAINER_NAME="mariadb"
DB_NAME="dolidb"
DB_TABE="llx_usergroup"
CSV_FILE="./group.csv"
MYSQL_USER="dolidbuser"
MYSQL_PASSWORD="dolidbpass"

# Check fichier CSV
if [ ! -f "$CSV_FILE" ]; then
  echo "Error: CSV file not found at $CSV_FILE"
  exit 1
fi

# Check docker
if ! docker ps --format '{{.Names}}' | grep -q "$DB_CONTAINER_NAME"; then
  echo "Error: Docker container $DB_CONTAINER_NAME is not running."
  exit 1
fi

# Importe le CSV
docker exec -i "$DB_CONTAINER_NAME" \
  mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" "$DB_TABE" < "$CSV_FILE"

# Check l'import
if [ $? -eq 0 ]; then
  echo "CSV imported successfully into the $DB_NAME database."
else
  echo "Error: Failed to import CSV dump."
  exit 1
fi
