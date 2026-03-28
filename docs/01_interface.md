# 01 - Interface Apache Hop Web

## Accès

URL : http://localhost:8080

## Zones principales

### 1. Barre de menu (haut)
- **File** : Nouveau projet, ouvrir, sauvegarder
- **Edit** : Copier, coller, annuler
- **Run** : Exécuter le pipeline courant
- **View** : Affichage et zoom du canvas

### 2. Explorateur (gauche)
- **Projets** : Liste des projets Hop
- **Pipelines** : Fichiers `.hpl`
- **Workflows** : Fichiers `.hwf`
- **Connexions** : Sources de données
- **Métadonnées** : Variables, connexions, serveurs

### 3. Canvas (centre)
- Zone de conception visuelle
- **Glisser-déposer** des transforms
- **Double-clic** pour configurer un transform
- **Clic droit** pour le menu contextuel

### 4. Panneau de configuration (droite)
- Propriétés du transform sélectionné
- Onglets : Général, Champs, Options

### 5. Console de log (bas)
- Logs d'exécution en temps réel
- Niveaux : DEBUG, INFO, WARNING, ERROR
- Métriques : lignes lues/écrites, durée

## Raccourcis clavier

| Raccourci | Action |
|-----------|--------|
| Ctrl+S | Sauvegarder |
| Ctrl+Z | Annuler |
| Ctrl+A | Sélectionner tout |
| F5 | Exécuter |
| Ctrl+Shift+P | Palette de transforms |

## Palette de transforms

La palette est accessible via l'icône en haut à gauche du canvas.
Elle regroupe les transforms par catégorie :
- **Input** : Lecture (Table, CSV, Excel, JSON...)
- **Output** : Écriture (Table, CSV, Excel...)
- **Transform** : Transformation (Select, Filter, Sort...)
- **Join** : Jointure et mélange
- **Scripting** : JavaScript, Groovy, SQL
- **Integration** : REST, SOAP, Kafka, S3
