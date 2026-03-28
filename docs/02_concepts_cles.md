# 02 - Concepts clés Apache Hop

## Architecture

### Pipeline vs Workflow

| | Pipeline | Workflow |
|--|---------|----------|
| Fichier | `.hpl` | `.hwf` |
| Exécution | Parallèle (stream) | Séquentiel |
| Icône | Flèche | Engrenage |
| Usage | ETL row-by-row | Orchestration |

### Transform
Unité de traitement atomique dans un pipeline.
Chaque transform reçoit des lignes, les transforme, et envoie les résultats.

### Hop (connexion)
Lien orienté entre deux transforms. Définit le flux de données.
- **Hop actif** : vert
- **Hop erreur** : rouge
- **Hop désactivé** : gris

### Projet Hop
Unité organisationnelle contenant :
- Des pipelines et workflows
- Des connexions de métadonnées
- Des variables de projet
- Des configurations d'environnement

## Concepts ETL fondamentaux

### Extract (Extraire)
Lecture de données depuis une source :
- `TableInput` : requête SQL
- `CsvInput` : fichier CSV
- `JsonInput` : fichier/API JSON
- `ExcelInput` : fichiers Excel
- `Rest` : API HTTP

### Transform (Transformer)
Modification des données :
- `SelectValues` : sélection/renommage de champs
- `FilterRows` : filtrage conditionnel
- `Calculator` : calculs arithmétiques
- `StringOperations` : manipulation de chaînes
- `MergeJoin` : jointure de deux flux

### Load (Charger)
Écriture vers une destination :
- `TableOutput` : INSERT vers une table
- `InsertUpdate` : UPSERT intelligent
- `CsvOutput` : export CSV
- `ExcelOutput` : export Excel

## Variables et paramètres

```
${variable_name}   # Variable Hop
%%variable_name%%  # Variable système
```

Définissables dans :
- Métadonnées du projet
- Fichier `.properties`
- Ligne de commande (`-param:name=value`)

## Connexions métadonnées

Stockées dans le répertoire `metadata/` du projet.
Types supportés :
- PostgreSQL, MySQL, Oracle, SQLite
- MongoDB, Cassandra
- S3, HDFS, GCS
- JDBC générique
