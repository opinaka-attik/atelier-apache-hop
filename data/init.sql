-- =============================================================
-- Apache Hop - Atelier ETL - Donnees d'initialisation
-- Base : hopdb | User : hopuser | Pass : hoppass
-- =============================================================

-- Module 02 : Table source clients
CREATE TABLE IF NOT EXISTS clients_raw (
  id          SERIAL PRIMARY KEY,
  nom         VARCHAR(100),
  prenom      VARCHAR(100),
  email       VARCHAR(150),
  telephone   VARCHAR(20),
  ville       VARCHAR(80),
  pays        VARCHAR(50),
  age         INTEGER,
  revenu      NUMERIC(10,2),
  inscrit_le  DATE,
  statut      VARCHAR(20)
);

INSERT INTO clients_raw (nom, prenom, email, telephone, ville, pays, age, revenu, inscrit_le, statut) VALUES
  ('Martin',   'Alice',   'alice.martin@email.com',  '06 11 22 33 44', 'Paris',      'France',  34, 45000.00, '2023-01-15', 'actif'),
  ('Bernard',  'Bruno',   'b.bernard@mail.fr',       '07 22 33 44 55', 'Lyon',       'France',  28, 32000.00, '2023-03-22', 'actif'),
  ('Dupont',   'Claire',  'claire.d@gmail.com',      NULL,             'Marseille',  'France',  45, 58000.00, '2023-02-10', 'inactif'),
  ('Lemaire',  'David',   'david.lemaire@pro.fr',    '06 44 55 66 77', 'Toulouse',   'France',  31, 41000.00, '2023-06-05', 'actif'),
  ('Moreau',   'Emma',    'emma.moreau@email.com',   '07 55 66 77 88', 'Nice',       'France',  27, 29000.00, '2024-01-20', 'actif'),
  ('Garcia',   'Fabien',  NULL,                      '06 66 77 88 99', 'Bordeaux',   'France',  52, 72000.00, '2022-11-30', 'vip'),
  ('Petit',    'Grace',   'grace.petit@email.com',   '07 77 88 99 00', 'Nantes',     'France',  39, 48000.00, '2023-08-14', 'actif'),
  ('Durand',   'Hugo',    'hugo.d@email.com',        '06 88 99 00 11', 'Strasbourg', 'France',  23, 24000.00, '2024-02-28', 'actif'),
  ('Leroy',    'Isabelle','i.leroy@mail.com',         NULL,            'Lille',      'France',  61, 85000.00, '2022-05-17', 'vip'),
  ('Simon',    'Julien',  'julien.simon@email.com',  '07 99 00 11 22', 'Rennes',     'France',  35, 39000.00, '2023-09-03', 'inactif');

-- Module 02 : Table destination clients_clean
CREATE TABLE IF NOT EXISTS clients_clean (
  id          SERIAL PRIMARY KEY,
  nom_complet VARCHAR(200),
  email       VARCHAR(150),
  telephone   VARCHAR(20),
  ville       VARCHAR(80),
  pays        VARCHAR(50),
  age         INTEGER,
  revenu      NUMERIC(10,2),
  segment     VARCHAR(20),
  inscrit_le  DATE,
  charge_le   TIMESTAMP DEFAULT NOW()
);

-- Module 03 : Table commandes
CREATE TABLE IF NOT EXISTS commandes (
  id           SERIAL PRIMARY KEY,
  client_id    INTEGER REFERENCES clients_raw(id),
  produit      VARCHAR(100),
  categorie    VARCHAR(50),
  quantite     INTEGER,
  prix_unitaire NUMERIC(10,2),
  date_commande DATE,
  statut       VARCHAR(20)
);

INSERT INTO commandes (client_id, produit, categorie, quantite, prix_unitaire, date_commande, statut) VALUES
  (1, 'Laptop Pro 15',     'Electronique', 1, 1299.99, '2024-01-10', 'livre'),
  (2, 'Casque Bluetooth',  'Electronique', 2,   89.99, '2024-01-15', 'livre'),
  (3, 'Bureau Standing',   'Mobilier',     1,  449.00, '2024-01-20', 'en_cours'),
  (4, 'Souris Ergonomique','Electronique', 3,   49.99, '2024-02-01', 'livre'),
  (5, 'Chaise Ergonomique','Mobilier',     1,  299.00, '2024-02-10', 'livre'),
  (1, 'Clavier Mecanique', 'Electronique', 1,  129.99, '2024-02-15', 'livre'),
  (6, 'Moniteur 4K 27"',   'Electronique', 2,  599.99, '2024-02-20', 'livre'),
  (7, 'Webcam HD Pro',     'Electronique', 1,   79.99, '2024-03-01', 'annule'),
  (8, 'Lampe Bureau LED',  'Bureau',       2,   34.99, '2024-03-05', 'livre'),
  (9, 'Support Laptop',    'Accessoires',  1,   59.99, '2024-03-10', 'en_cours');

-- Module 04 : Table KPIs aggreges
CREATE TABLE IF NOT EXISTS kpis_mensuels (
  id          SERIAL PRIMARY KEY,
  mois        VARCHAR(7),
  nb_commandes INTEGER,
  ca_total    NUMERIC(12,2),
  ca_moyen    NUMERIC(10,2),
  nb_clients  INTEGER,
  charge_le   TIMESTAMP DEFAULT NOW()
);

SELECT 'Donnees initialisees avec succes' AS message;
