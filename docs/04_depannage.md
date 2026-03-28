# 04 - Dépannage Apache Hop

## Problèmes courants

### L'interface web ne se charge pas

**Symptôme** : http://localhost:8080 inaccessible

**Vérifications** :
```bash
# Vérifier que le container tourne
docker compose ps

# Voir les logs
docker compose logs hop-web

# Vérifier le port
netstat -tulnp | grep 8080
```

**Solution** : Attendre 60-90 secondes au premier démarrage (Hop Web est lent à initialiser).

---

### Erreur de connexion PostgreSQL

**Symptôme** : `Connection refused` ou `FATAL: database does not exist`

**Vérifications** :
```bash
# Tester la connexion
docker compose exec hop-postgres psql -U hopuser -d hopdb -c "SELECT 1"

# Voir les logs postgres
docker compose logs hop-postgres
```

**Solution** : Vérifier les variables d'environnement dans `docker-compose.yml`.

---

### Pipeline échoue avec "field not found"

**Symptôme** : `Error: field 'xxx' not found in input stream`

**Causes** :
- Le nom du champ dans le transform ne correspond pas à la source
- La casse est incorrecte (Hop est sensible à la casse)

**Solution** : Utiliser `Preview` sur le transform précédent pour voir les noms exacts des champs.

---

### MergeJoin ne produit pas de résultats

**Symptôme** : Zéro ligne en sortie du `MergeJoin`

**Cause** : Les deux flux d'entrée ne sont pas triés par la clé de jointure.

**Solution** : Ajouter un transform `SortRows` sur la clé de jointure **avant** chaque entrée du `MergeJoin`.

---

### Erreur mémoire (OutOfMemory)

**Symptôme** : `java.lang.OutOfMemoryError: Java heap space`

**Solution** :
```yaml
# Dans docker-compose.yml, augmenter la mémoire :
environment:
  HOP_OPTIONS: "-Xms512m -Xmx2048m"
```

---

### Recharger un projet

Si les modifications ne sont pas prises en compte :
1. Menu `File` → `Reload project`
2. Ou redémarrer le container : `docker compose restart hop-web`

## Commandes utiles

```bash
# Voir tous les logs
docker compose logs -f

# Redémarrer un service
docker compose restart hop-web

# Accéder au shell du container
docker compose exec hop-web bash

# Vérifier les tables PostgreSQL
docker compose exec hop-postgres psql -U hopuser -d hopdb -c "\dt"

# Exécuter un pipeline en ligne de commande
docker compose exec hop-web /opt/hop/hop-run.sh \
  -r local \
  -p /opt/hop/projects/atelier \
  -f pipelines/01_hello_pipeline.hpl
```

## Réinitialiser l'environnement

```bash
docker compose down -v
docker compose up -d
```

> **Attention** : `-v` supprime les volumes et donc toutes les données PostgreSQL.
