------------ Création de la table Attente ----------
CREATE TABLE Attente (
    numero NUMBER,
    ordre VARCHAR(300),
    CONSTRAINT pk_numero PRIMARY KEY (numero)
);

------------ Création de la séquence ---------------
CREATE SEQUENCE seq_attente START WITH 1 INCREMENT BY 1;

DROP SEQUENCE seq_athlete;

CREATE SEQUENCE SEQ_ATT
START WITH 1
INCREMENT BY 1;



