#!/bin/bash

# Variables
DB_CONTAINER_NAME="mariadb"
DB_NAME="dolidb"
DB_TABE="llx_usergroup"
CSV_FILE="../Data/llx_usergroup.csv"
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

# Docker cp
docker cp "$CSV_FILE" "$DB_CONTAINER_NAME:/tmp/llx_usergroup.csv"

# Import CSV 
docker exec -i "$DB_CONTAINER_NAME" mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" <<EOF
LOAD DATA INFILE '/tmp/llx_usergroup.csv'
INTO TABLE $DB_TABLE
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SET FOREIGN_KEY_CHECKS=1;
EOF

