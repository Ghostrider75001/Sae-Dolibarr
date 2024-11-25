#!/bin/bash

# Variables
DB_CONTAINER_NAME="mariadb"
DB_NAME="dolidb"
SQL_DUMP_FILE="./backup/dolidb_2024-11-25.sql"
MYSQL_USER="dolidbuser"
MYSQL_PASSWORD="dolidbpass"

# Check if the dump file exists
if [ ! -f "$SQL_DUMP_FILE" ]; then
  echo "Error: SQL dump file not found at $SQL_DUMP_FILE"
  exit 1
fi

# Check if the container is running
if ! docker ps --format '{{.Names}}' | grep -q "$DB_CONTAINER_NAME"; then
  echo "Error: Docker container $DB_CONTAINER_NAME is not running."
  exit 1
fi

# Import the SQL dump into the MariaDB container
docker exec -i "$DB_CONTAINER_NAME" \
  mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" < "$SQL_DUMP_FILE"

# Check if the import was successful
if [ $? -eq 0 ]; then
  echo "SQL dump imported successfully into the $DB_NAME database."
else
  echo "Error: Failed to import SQL dump."
  exit 1
fi
