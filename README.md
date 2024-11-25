# ERP/CRM Project with Dolibarr

## Introduction
This project involves migrating from an outsourced ERP/CRM solution to an internally hosted solution based on the Dolibarr software package. The objective is to establish a functional Dolibarr instance on a dedicated server within the company by automating the installation, data import, and ensuring data backup.

## Specifications 
- Automate the installation of Dolibarr and the DBMS via an `install.sh` script.
- Automate the import of exported data via an `import_csv.sh` script.
- Dockerize the installation for easier deployment.
- Ensure a complete backup procedure to allow recovery after an incident.

## Project steps 
1. Discovery of Dolibarr with simple installation on a Debian VM.
2. Importing existing data using the functionalities integrated into Dolibarr or by directly manipulating the DBMS.
3. Dockerization of the installation by creating Dockerfiles for Dolibarr and the DBMS.


## Ressources
- [Wiki Dolibarr](https://wiki.dolibarr.org/)
- [Site officiel Dolibarr](https://www.dolibarr.org/)
- [GitHub Dolibarr](https://github.com/Dolibarr/dolibarr/)

---

This README.md file contains essential information regarding the ERP/CRM installation project with Dolibarr. 

## Set up 
We carried out research work on the dolibarrr docker image which can be found on dockerhub. 
We agreed to choose to use the basic configuration provided by the company. The configuration includes a web server container and a mariadb database server. 
To follow the specifications, we need a unique script to install the ERP solution. We therefore created an `install.sh` script. 
This script can install the dependencies necessary for the implementation of the ERP. Once set up, the dolibarr has the basic identifiers `admin admin`.
Next we moved on to backing up the database. To do a dump backup, we created a `backup.sh` script which saves an SQL file from the database.
He therefore Required a program to import the database backup. For this we created the script `import_sql.sh`
