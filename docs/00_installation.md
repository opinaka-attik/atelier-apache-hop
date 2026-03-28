# 00 - Installation d'Apache Hop

## Prérequis

- Docker >= 20.10
- Docker Compose >= 2.0
- 4 Go RAM minimum (8 Go recommandés)
- Ports libres : 8080 (Hop Web), 5432 (PostgreSQL)

## Lancement rapide

```bash
git clone https://github.com/opinaka-attik/atelier-apache-hop
cd atelier-apache-hop
docker compose up -d
```

## Vérification

```bash
docker compose ps
# hop-web doit être "Up"
# hop-postgres doit être "Up"
```

Ouvrir le navigateur : http://localhost:8080

## Structure des services

| Service | Port | Rôle |
|---------|------|------|
| hop-web | 8080 | Interface web Apache Hop |
| hop-postgres | 5432 | Base de données PostgreSQL |

## Connexion PostgreSQL préconfigurée

La connexion `postgres_hop` est préconfigurée dans les pipelines :

- **Hôte** : hop-postgres
- **Port** : 5432
- **Base** : hopdb
- **Utilisateur** : hopuser
- **Mot de passe** : hoppass

## Arrêt et nettoyage

```bash
# Arrêter
docker compose down

# Arrêter et supprimer les volumes
docker compose down -v
```

## Mise à jour

```bash
docker compose pull
docker compose up -d
```
