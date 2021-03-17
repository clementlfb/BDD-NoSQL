-- TP1 -- Clément LEFEBVRE

-- EXERCICE 1 -- 

-- Dans un premier temps, nous créons le répertoire elections

CREATE KEYSPACE elections WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };


-- Nous créons la table administre --

CREATE TABLE elections.administre (
    Nom_A text PRIMARY KEY,
    Prenom_A text,
    Adresse text,
);

-- Nous créons la table candidat -- 

CREATE TABLE elections.Candidat (
    Nom_P text ,
    Prenom_P text,
    Parti_politique text,
    nbr_vote int ,
  PRIMARY KEY (Nom_P, nbr_vote)
)WITH CLUSTERING ORDER BY (nbr_vote desc);

-- Nous créons la table vote -- 

CREATE TABLE elections.Vote (
Nom_A text,
Nom_P text,
PRIMARY KEY(Nom_A, Nom_P)
);

-- Nous insérons des valeurs dans la table Candidat --

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote )
VALUES ('c_u' , 'candidat_un', 'A' , 10 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('c_d', 'candidat_deux', 'B' , 5 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('c_t' , 'candidat_trois', 'C' , 15 );

INSERT INTO elections.Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('c_q' , 'candidat_quatre', 'A' , 30 );

-- Question 1 - Quel parti politique a réuni le plus de voix ? -- 

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique= 'A' ALLOW FILTETING;

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique= 'B' ALLOW FILTERING;

SELECT sum(nbr_vote) from elections.Candidat Where Parti_politique = 'C' ALLOW FILTERING; 

-- Question 2 - Quel candidat a gagné les élections ? -- 

SELECT max(nbr_vote) from elections.Candidat; 

-- Question 3 - Le candidat ayant gagné les élections vient-il du parti politique ayant eu la majorité des voix ? -- 

-- D'apres le résultat de ma machine : OUI --

-- EXERCICE 2 -- 

-- Question 1 - Quel est le parti politique ayant eu le plus de voix ? 

SELECT MAX(nbr_vote),Parti_politique FROM elections.candidat2

-- Question 2 - Quel est le parti politique ayant eu le moins de voix ?

SELECT MIN (nbr_vote),Parti_politique FROM elections.candidat;

SELECT Parti_politique, MIN (nbr_vote) FROM elections.candidat2 GROUP BY Parti_politique;