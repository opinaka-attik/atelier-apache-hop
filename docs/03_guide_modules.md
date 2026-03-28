# 03 - Guide des modules (Pipelines)

## Module 01 - Hello Pipeline

**Fichier** : `pipelines/01_hello_pipeline.hpl`
**Objectif** : Premier pipeline, comprendre le flux de données

### Étapes
1. `Générer données` : créé 5 lignes avec `RowGenerator`
2. `Ajouter message` : ajoute un champ calculé
3. `Log résultat` : affiche dans la console

### Lancer
Ouvrir le fichier dans Hop Web → cliquer `Run` (F5)

---

## Module 02 - CSV vers PostgreSQL

**Fichier** : `pipelines/02_csv_to_postgres.hpl`
**Objectif** : Charger un fichier CSV dans une table PostgreSQL

### Étapes
1. `Lire CSV` : lit `data/commandes.csv`
2. `Convertir types` : cast des types de données
3. `Charger PostgreSQL` : INSERT batch dans `commandes`
4. `Log chargement` : log du résultat

### Prérequis
- Le fichier `data/commandes.csv` doit être accessible
- La table `commandes` doit exister (créée par `init.sql`)

---

## Module 03 - Jointure et Agrégation

**Fichier** : `pipelines/03_join_aggregation.hpl`
**Objectif** : Joindre deux tables et calculer des KPIs

### Étapes
1. `Lire commandes` + `Lire clients` : deux lectures parallèles
2. `Joindre commandes clients` : `MergeJoin` sur `client_id`
3. `Agréger CA mensuel` : GROUP BY avec somme et moyenne
4. `Ecrire KPIs` : INSERT dans `kpis_mensuels`
5. `Log résultat` : confirmation

### Concept clé
Les deux sources doivent être **triées** par la clé de jointure avant `MergeJoin`.

---

## Module 04 - API REST vers Base

**Fichier** : `pipelines/04_rest_api_to_db.hpl`
**Objectif** : Consommer une API HTTP et stocker les données

### Étapes
1. `Appel API REST` : GET https://jsonplaceholder.typicode.com/users
2. `Parser JSON` : extraction des champs avec JSONPath
3. `Nettoyer champs` : typage explicite
4. `Insérer PostgreSQL` : INSERT avec truncate
5. `Log résultat` : confirmation

### JSONPath utilisés
- `$.id`, `$.name`, `$.email`, `$.phone`, `$.website`

---

## Module 05 - Chargement Incrémental

**Fichier** : `pipelines/05_incremental_load.hpl`
**Objectif** : Charger uniquement les nouvelles/modifiées lignes

### Étapes
1. `Lire watermark` : récupère le MAX(updated_at) de la cible
2. `Lire nouvelles commandes` : SELECT source WHERE updated_at > watermark
3. `Ajouter date_chargement` : timestamp du chargement
4. `Upsert PostgreSQL` : INSERT ou UPDATE via `InsertUpdate`
5. `Log fin chargement` : confirmation

### Pattern Watermark
Ce pattern est la base des pipelines incrémentaux :
- Stocker la dernière date de chargement
- Lire uniquement ce qui est plus récent
- Faire un UPSERT (insert si nouveau, update si existant)
