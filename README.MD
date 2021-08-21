# PROCEDURE POUR L'UTILISATION 

## Se connecter mysql 
```
mysql -u -p 
```

## Créer une base de données 
```
CREATE DATABASE [name_db] IF NOT EXISTS;
use [db_name]
```
## importer le fichier .sql

```
source filename.sql
```
## Création des tables, 
dans le terminal connecter a mysql
```
CALL creationTable;

```
## création des  users 

```
  CREATE USER userName@'localhost' IDENTIFIED WITH psswd;
    GRANT INSERT,DELETE, UPDATE,SELECT ON cinema.movies TO userName@'localhost';
    GRANT INSERT,DELETE, UPDATE,SELECT ON cinema.sessions TO userName@'localhost';
```
## création des administratreurs
```
 CREATE USER userName@'localhost' IDENTIFIED WITH psswd;
    GRANT ALL ON cinema.* TO userName@'localhost';
```
## exporter une base de donnée 
sortir de mysql 
```
mysqldump -u -p name_db > filename.sql
```