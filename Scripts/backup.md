# Documentation for Database Backup Script
This script is a Bash script designed to create a backup of a MariaDB database running in a Docker container. It exports the database into a SQL dump file stored on the host machine.

#### Prerequisites
Docker must be installed and running on the host machine.
A MariaDB container must be running with the appropriate credentials set up.

#### Variables
The following variables are defined at the beginning of the script:

- DB_CONTAINER_NAME: The name of the Docker container running the MariaDB instance. Default is set to "mariadb".
- DB_USER: The username to connect to the database. Default is set to "dolidbuser".
- DB_PASSWORD: The password for the database user. Default is set to "dolidbpass".
- DB_NAME: The name of the database to be backed up. Default is set to "dolidb".
- HOST_DUMP_DIR: The directory on the host machine where the dump file will be stored. Default is set to "./backup".
- DUMP_FILE: The name of the dump file, which includes the database name and the current date in YYYY-MM-DD format.

#### Usage
To use the script, follow these steps:
* Make the script executable :
```
sudo chmod +x backup.sh
```

* Run the script :
```
sudo ./backup.sh
```

#### Conclusion
This Bash script simplifies the process of creating a backup of a MariaDB database in a Docker container. By modifying the defined variables, users can adapt the script to their specific needs.
