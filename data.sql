drop database stock;
CREATE DATABASE stock;
\c stock;

CREATE SEQUENCE move_seq;
CREATE SEQUENCE mgs_seq;
CREATE SEQUENCE estk_seq;

CREATE TABLE type_sortie(
    type_sortie_id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20)
);
    
CREATE TABLE type_mouvement(
    type_mouvement_id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20)
);

CREATE TABLE magasins(
    magasin_id VARCHAR(20) DEFAULT 'MGS' || nextval('mgs_seq') PRIMARY KEY,
    nom VARCHAR(20)
);

CREATE TABLE articles(
    article_id VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(50),
    type_sortie_id VARCHAR(20),
    FOREIGN KEY (type_sortie_id) REFERENCES type_sortie(type_sortie_id)
);

CREATE TABLE mouvements(
    mouvement_id VARCHAR(20) DEFAULT 'MOVE' || nextval('move_seq') PRIMARY KEY,
    daty TIMESTAMP,
    quantite FLOAT,
    article_id VARCHAR(20),
    prix_unitaire FLOAT,
    type_mouvement_id VARCHAR(20),
    magasin_id VARCHAR(20),
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (type_mouvement_id) REFERENCES type_mouvement(type_mouvement_id),
    FOREIGN KEY (magasin_id) REFERENCES magasins(magasin_id)
);

CREATE TABLE etat_stock(
    etat_stock_id VARCHAR(20) DEFAULT 'ESTK' || nextval('estk_seq') PRIMARY KEY,
    date_debut TIMESTAMP,
    date_fin TIMESTAMP,
    article_id VARCHAR(20),
    quantite_restante FLOAT,
    prix_unitaire FLOAT,
    magasin_id VARCHAR(20),
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (magasin_id) REFERENCES magasins(magasin_id)
);

INSERT INTO type_sortie(type_sortie_id,nom) VALUES('TS1','FIFO');
INSERT INTO type_sortie(type_sortie_id,nom) VALUES('TS2','LIFO');

INSERT INTO type_mouvement(type_mouvement_id,nom) VALUES('TM1','Stockage');
INSERT INTO type_mouvement(type_mouvement_id,nom) VALUES('TM2','Destockage');

INSERT INTO magasins(nom) VALUES('Magasin M');
INSERT INTO magasins(nom) VALUES('Magasin U');
INSERT INTO magasins(nom) VALUES('TRI-A');
INSERT INTO magasins(nom) VALUES('Soamanatombo');

INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR001','Vary Fotsy','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR0011','Vary Fotsy Makalioka','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR0012','Vary Fotsy Stoky','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR002','Vary Mena','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR0021','Vary Mena Makalioka','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('VAR0022','Vary Mena Stoky','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('MEN001','Menaka Mandry','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('MEN002','Menaka Tsy mandry','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('MEN0021','Menaka Tsy mandry tournesol','TS1');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('GUIT001','Guitare Accoustique','TS2');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('GUIT0011','Guitare Accoustique equaliseur','TS2');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('GUIT002','Guitare Classique','TS2');
INSERT INTO articles(article_id,nom,type_sortie_id) VALUES('GUIT0021','Guitare Classique Equaliseur','TS2');

SELECT *FROM mouvements where lower(concat(article_id)) like lower('VAR%') and lower(concat(type_mouvement_id)) like lower('TM1%') and lower(concat(magasin_id)) like lower('MGS1%');