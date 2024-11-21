-------------- Sur ETUPRE ----------------
--------Vue pour Sport
CREATE OR REPLACE VIEW Sport AS
    SELECT s1.*, s2.urls 
    FROM Sport_1@dbl_etupre s1, 
        Sport_2@dbl_etusec s2 
    WHERE s1.cds = s2.cds;

--------Vue pour Discipline
CREATE OR REPLACE VIEW Discipline AS
    SELECT ndd, nomd, typed, 'M' AS genred, cds 
    FROM Discipline_1@dbl_etupre
    UNION
    SELECT ndd, nomd, typed, 'W' AS genred, cds 
    FROM Discipline_2@dbl_etusec
    UNION
    SELECT *
    FROM Discipline_3@dbl_etuter;

--------Vue pour Athlete
CREATE OR REPLACE VIEW Athlete AS 
    SELECT nda, ncomplet, 'M' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_1@dbl_etupre
    UNION
    SELECT nda, ncomplet, 'F' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_2@dbl_etusec;

--------Vue pour Pratiquer
CREATE OR REPLACE VIEW Pratiquer AS
    SELECT *
    FROM Pratiquer_1@dbl_etupre
    UNION
    SELECT *
    FROM Pratiquer_2@dbl_etusec
    UNION
    SELECT *
    FROM Pratiquer_3@dbl_etuter;

--------Vue pour Gagner_I
CREATE OR REPLACE VIEW Gagner_I AS
    SELECT *
    FROM Gagner_I_1@dbl_etupre
    UNION
    SELECT *
    FROM Gagner_I_2@dbl_etusec
    UNION
    SELECT *
    FROM Gagner_I_3@dbl_etuter;

--------Vue pour Pays
CREATE SYNONYM Pays 
FOR Pays_3@dbl_etuter;

--------Vue pour Gagner_E
CREATE SYNONYM Gagner_E
FOR Gagner_E_3@dbl_etuter;

---------------------------------------------------------------------
-------------- Sur ETUSEC ----------------
--------Vue pour Sport
CREATE OR REPLACE VIEW Sport AS
    SELECT s1.*, s2.urls 
    FROM Sport_1@dbl_etupre s1, 
        Sport_2@dbl_etusec s2 
    WHERE s1.cds = s2.cds;

--------Vue pour Discipline
CREATE OR REPLACE VIEW Discipline AS
    SELECT ndd, nomd, typed, 'M' AS genred, cds 
    FROM Discipline_1@dbl_etupre
    UNION
    SELECT ndd, nomd, typed, 'W' AS genred, cds 
    FROM Discipline_2@dbl_etusec
    UNION
    SELECT *
    FROM Discipline_3@dbl_etuter;

--------Vue pour Athlete
CREATE OR REPLACE VIEW Athlete AS 
    SELECT nda, ncomplet, 'M' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_1@dbl_etupre
    UNION
    SELECT nda, ncomplet, 'F' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_2@dbl_etusec;

--------Vue pour Pratiquer
CREATE OR REPLACE VIEW Pratiquer AS
    SELECT *
    FROM Pratiquer_1@dbl_etupre
    UNION
    SELECT *
    FROM Pratiquer_2@dbl_etusec
    UNION
    SELECT *
    FROM Pratiquer_3@dbl_etuter;

--------Vue pour Gagner_I
CREATE OR REPLACE VIEW Gagner_I AS
    SELECT *
    FROM Gagner_I_1@dbl_etupre
    UNION
    SELECT *
    FROM Gagner_I_2@dbl_etusec
    UNION
    SELECT *
    FROM Gagner_I_3@dbl_etuter;

--------Vue pour la séquence sur Discipline
CREATE SYNONYM seq_discipline
FOR seq_discipline@dbl_etupre;

--------Vue pour Pays
CREATE SYNONYM Pays 
FOR Pays_3@dbl_etuter;

--------Vue pour Gagner_E
CREATE SYNONYM Gagner_E
FOR Gagner_E_3@dbl_etuter;

---------------------------------------------------------------------
-------------- Sur ETUTER ----------------
--------Vue pour Sport
CREATE OR REPLACE VIEW Sport AS
    SELECT s1.*, s2.urls 
    FROM Sport_1@dbl_etupre s1, 
        Sport_2@dbl_etusec s2 
    WHERE s1.cds = s2.cds;

--------Vue pour Discipline
CREATE OR REPLACE VIEW Discipline AS
    SELECT ndd, nomd, typed, 'M' AS genred, cds 
    FROM Discipline_1@dbl_etupre
    UNION
    SELECT ndd, nomd, typed, 'W' AS genred, cds 
    FROM Discipline_2@dbl_etusec
    UNION
    SELECT *
    FROM Discipline_3@dbl_etuter;

--------Vue pour Athlete
CREATE OR REPLACE VIEW Athlete AS 
    SELECT nda, ncomplet, 'M' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_1@dbl_etupre
    UNION
    SELECT nda, ncomplet, 'F' AS genre, taille, poids, daten, villen, paysn, cio
    FROM Athlete_2@dbl_etusec;

--------Vue pour Pratiquer
CREATE OR REPLACE VIEW Pratiquer AS
    SELECT *
    FROM Pratiquer_1@dbl_etupre
    UNION
    SELECT *
    FROM Pratiquer_2@dbl_etusec
    UNION
    SELECT *
    FROM Pratiquer_3@dbl_etuter;

--------Vue pour Gagner_I
CREATE OR REPLACE VIEW Gagner_I AS
    SELECT *
    FROM Gagner_I_1@dbl_etupre
    UNION
    SELECT *
    FROM Gagner_I_2@dbl_etusec
    UNION
    SELECT *
    FROM Gagner_I_3@dbl_etuter;

--------Vue pour la séquence sur Discipline
CREATE SYNONYM seq_discipline
FOR seq_discipline@dbl_etupre;

--------Vue pour Pays
CREATE SYNONYM Pays 
FOR Pays_3@dbl_etuter;

--------Vue pour Gagner_E
CREATE SYNONYM Gagner_E
FOR Gagner_E_3@dbl_etuter;