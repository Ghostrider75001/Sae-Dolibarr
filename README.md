# Projet ERP/CRM avec Dolibarr

## Introduction
Ce projet consiste à migrer d'une solution ERP/CRM externalisée vers une solution hébergée en interne basée sur le progiciel Dolibarr. Le but est de mettre en place un Dolibarr fonctionnel sur un serveur dédié dans l'entreprise en automatisant l'installation, l'import des données et en assurant la sauvegarde des données.

## Cahier des charges
- Automatiser l'installation de Dolibarr et du SGBD via un script `install.sh`.
- Automatiser l'import des données exportées via un script `import_csv.sh`.
- Dockeriser l'installation pour faciliter le déploiement.
- Assurer une procédure de sauvegarde complète pour permettre une reprise après incident.

## Étapes du projet
1. Découverte de Dolibarr avec installation simple sur une VM Debian.
2. Importation des données existantes en utilisant les fonctionnalités intégrées à Dolibarr ou en manipulant directement le SGBD.
3. Dockerisation de l'installation en créant des Dockerfiles pour Dolibarr et le SGBD.

## Ressources
- [Wiki Dolibarr](https://wiki.dolibarr.org/)
- [Site officiel Dolibarr](https://www.dolibarr.org/)
- [GitHub Dolibarr](https://github.com/Dolibarr/dolibarr/)

---

Ce fichier README.md contient les informations essentielles concernant le projet d'installation d'un ERP/CRM avec Dolibarr.

## Mise en place

Nous avons réaliser un travail de recherche sur l'image docker de dolibarrr que l'on retrouve sur dockerhub.

Nous nous sommes accordés pour choisir d'utiliser la configuration de base de donner par l'entreprise. La configuration comprends un conteneur de serveur web et une serveur de base de données mariadb.

Pour suivre le cahier des charges, il nous faut un script unique pour installer la solution d'ERP. Nous avont donc créer un script `install.sh`.

Ce script peut installer les dépendance necessaire à la mise en place de l'ERP. Une fois mis en place, le dolibarr possède les identifiants de base `admin admin`.

Ensuite nous nous sommes dirigé vers la sauvergarde de la base de données. Pour faire une sauvgarde en dump, nous avons créé un script `backup.sh` qui sauvegarde un fichier sql de la database

Il a donc fallut un programme pour importer la sauvegarde de la base de données. Pour ça nous avont créé le script `import_sql.sh`

