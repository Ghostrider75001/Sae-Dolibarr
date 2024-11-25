# Documentation for MySQL Data Import Script
## Overview
This Bash script is designed to import SQL data into a MySQL database. 
It checks if :
- Specified SQL file exists
- Imports the data into the specified database
- Verifies the success of the import operation.

## Prerequisites
- MySQL must be installed and running on the system.
- The user must have appropriate permissions to access the database and import data.
- The specified SQL file must exist at the provided path.

## Variables
- *DB_NAME*: The name of the target database where the data will be imported. Default is set to "dolibarr".
- *DB_USER*: The MySQL username used for authentication. Default is set to "root".
- *DB_PASS*: The password for the specified MySQL user. Default is set to "root".
- *SQL_FILE*: The path to the SQL file to be imported. It is recommended to use an absolute path. Default is set to "Fichier_sql.sql".

## Usage
To use the script, follow these steps:
- Make the script executable:

```
chmod +x restore.sh

```

- Run the script:
```
sudo ./restore.sh

```

## Conclusion
This Bash script simplifies the process of importing SQL data into a MySQL database, 
providing checks for both the existence of the SQL file and the success of the import operation.
