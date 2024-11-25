# Documentation for Docker Installation and Dolibarr Setup Script
### Overview
This Bash script automates the installation and setup of Docker, Docker Compose, and the Dolibarr application using Docker containers. The script ensures that the system is updated, checks for the presence of Docker and Docker Compose, and sets up a Docker environment for running Dolibarr with a MariaDB database.


## Prerequisites
- A Debian-based Linux system (e.g., Ubuntu).
- Sufficient permissions to install packages and modify user groups.

## Variables
- *DOCKER_COMPOSE_FILE*: The name of the Docker Compose file to be created.
- Default is set to *"docker-compose.yml"*.

## Usage
To use the script:
- Make the script executable:
```
sudo chmod +x install.sh
```

- Run the script with sudo:
```
sudo ./install.sh
```

## Conclusion
This Bash script automates the installation and configuration of Docker, Docker Compose, and Dolibarr. It simplifies the setup process, making it easier for users to get started with Dolibarr on a Docker environment.
