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
