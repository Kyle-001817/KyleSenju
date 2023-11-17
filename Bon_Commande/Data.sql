CREATE DATABASE commerce;
\c commerce;

CREATE TABLE personnels(
    id_personnel VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20),
    fonction VARCHAR(20),
    email VARCHAR(50),
    passwords VARCHAR(20)
);
CREATE TABLE fournisseurs(
    id_fournisseur VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20),
    email VARCHAR(50),
    passwords VARCHAR(50)
);
CREATE TABLE departements(
    id_departement VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20),
    id_personnel VARCHAR(20),
    FOREIGN KEY (id_personnel) REFERENCES personnels(id_personnel)
);
CREATE TABLE articles(
    id_article VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20)
);
CREATE TABLE magasins(
    id_magasin VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(20),
    id_article VARCHAR(20),
    id_fournisseur VARCHAR(20),
    FOREIGN KEY (id_article) REFERENCES articles(id_article),
    FOREIGN KEY (id_fournisseur) REFERENCES fournisseurs(id_fournisseur)
);

//PROFPORMAT
//BON ACHAT