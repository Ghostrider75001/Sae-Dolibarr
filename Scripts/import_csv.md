# import de donées csv dans SGBD

Ce script est utilisé pour importer des données à partir des fichiers CSV dans la base de données Dolibarr.

#### Instructions d'utilisation
* Rendez le script exécutable :
```
sudo chmod +x import_csv.sh
```

* Exécutez le script (assurez-vous que les fichiers CSV sont dans le même répertoire) :
```
sudo ./import_csv.sh
```
###### Remarques
* Assurez-vous que MySQL est en cours d'exécution et que les fichiers clients.csv et fournisseurs.csv existent dans le même répertoire que le script.
* Modifiez les paramètres de connexion à la base de données si nécessaire.
