# Atelier Apache Hop

> Pipelines ETL visuels avec Apache Hop (successeur de Pentaho Data Integration)

[![Docker](https://img.shields.io/badge/Docker-ready-blue)](docker/docker-compose.yml)
[![Apache Hop](https://img.shields.io/badge/Apache%20Hop-2.x-orange)](https://hop.apache.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791)](https://postgresql.org)

## Démarrage rapide

```bash
git clone https://github.com/opinaka-attik/atelier-apache-hop
cd atelier-apache-hop
docker compose up -d
# Attendre 60-90 secondes
open http://localhost:8080
```

## Services

| Service | Port | URL |
|---------|------|-----|
| Hop Web (UI) | 8080 | http://localhost:8080 |
| PostgreSQL | 5432 | `hopuser:hoppass@localhost:5432/hopdb` |

## Modules

| # | Pipeline | Concepts couverts | Niveau |
|---|----------|-------------------|--------|
| 01 | `01_hello_pipeline.hpl` | RowGenerator, WriteToLog, flux de base | Débutant |
| 02 | `02_csv_to_postgres.hpl` | CsvInput, SelectValues, TableOutput | Débutant |
| 03 | `03_join_aggregation.hpl` | TableInput, MergeJoin, GroupBy, KPIs | Intermédiaire |
| 04 | `04_rest_api_to_db.hpl` | Rest, JsonInput, TableOutput (truncate) | Intermédiaire |
| 05 | `05_incremental_load.hpl` | Watermark, InsertUpdate, GetSystemInfo | Avancé |

## Documentation

| Fichier | Contenu |
|---------|----------|
| [00_installation.md](docs/00_installation.md) | Prérequis, lancement, connexions |
| [01_interface.md](docs/01_interface.md) | Navigation, zones, raccourcis |
| [02_concepts_cles.md](docs/02_concepts_cles.md) | Pipeline vs Workflow, ETL, variables |
| [03_guide_modules.md](docs/03_guide_modules.md) | Guide pas-à-pas des 5 modules |
| [04_depannage.md](docs/04_depannage.md) | Problèmes courants et solutions |

## Collection d'ateliers

| Outil | Repository | Catégorie |
|-------|------------|----------|
| Dify | [atelier-dify](https://github.com/opinaka-attik/atelier-dify) | IA / LLM |
| n8n | [atelier-n8n](https://github.com/opinaka-attik/atelier-n8n) | Automatisation |
| Activepieces | [atelier-activepieces](https://github.com/opinaka-attik/atelier-activepieces) | Automatisation |
| Flowise | [atelier-flowise](https://github.com/opinaka-attik/atelier-flowise) | IA / LLM |
| Langflow | [atelier-langflow](https://github.com/opinaka-attik/atelier-langflow) | IA / LLM |
| Budibase | [atelier-budibase](https://github.com/opinaka-attik/atelier-budibase) | No-code App |
| Maxun | [atelier-maxun](https://github.com/opinaka-attik/atelier-maxun) | Web Scraping |
| Dataiku | [atelier-dataiku](https://github.com/opinaka-attik/atelier-dataiku) | Data Science |
| Camunda | [atelier-camunda](https://github.com/opinaka-attik/atelier-camunda) | BPM / Workflow |
| **Apache Hop** | **[atelier-apache-hop](https://github.com/opinaka-attik/atelier-apache-hop)** | **ETL / Data** |
