-------------------------- CLES PRIMAIRES ------------------------
--------------Clé primaire pour Sport
ALTER TABLE Sport_1
ADD CONSTRAINT pk_sport_1 PRIMARY KEY (cds);

ALTER TABLE Sport_2
ADD CONSTRAINT pk_sport_2 PRIMARY KEY (cds);

------------Clé primaire pour Discipline
-------- Discipline_1 -----------
ALTER TABLE Discipline_1
ADD CONSTRAINT pk_discipline_1 PRIMARY KEY (ndd);

CREATE OR REPLACE TRIGGER t_iu_discipline_1_ndd
BEFORE INSERT OR UPDATE OF ndd
ON Discipline_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n
    FROM Discipline_2@dbl_etusec
    WHERE ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n
    FROM Discipline_3@dbl_etuter
    WHERE ndd = :NEW.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'N° de Discipline existant');
    END IF;
END;

-------- Discipline_2 -----------
ALTER TABLE Discipline_2
ADD CONSTRAINT pk_discipline_2 PRIMARY KEY (ndd);

CREATE OR REPLACE TRIGGER t_iu_discipline_2_ndd
BEFORE INSERT OR UPDATE OF ndd
ON Discipline_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Discipline_1@dbl_etupre
    WHERE ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n
    FROM Discipline_3@dbl_etuter
    WHERE ndd = :NEW.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'N° de Discipline existant');
    END IF;
END;

-------- Discipline_3 -----------
ALTER TABLE Discipline_3
ADD CONSTRAINT pk_discipline_3 PRIMARY KEY (ndd);

CREATE OR REPLACE TRIGGER t_iu_discipline_3_ndd
BEFORE INSERT OR UPDATE OF ndd
ON Discipline_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n
    FROM Discipline_1@dbl_etupre
    WHERE ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n 
    FROM Discipline_2@dbl_etusec
    WHERE ndd = :NEW.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'N° de Discipline existant');
    END IF;
END;

------------Clé primaire pour Athlete
-------- Athlete_1 -----------
ALTER TABLE Athlete_1
ADD CONSTRAINT pk_athlete_1 PRIMARY KEY (nda);

CREATE OR REPLACE TRIGGER t_iu_athlete_1_nda
BEFORE INSERT OR UPDATE OF nda
ON Athlete_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n
    FROM Athlete_2@dbl_etusec
    WHERE nda = :NEW.nda;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'N° Athlete existant');
    END IF;
END;

-------- Athlete_2 -----------
ALTER TABLE Athlete_2
ADD CONSTRAINT pk_athlete_2 PRIMARY KEY (nda);

CREATE OR REPLACE TRIGGER t_iu_athlete_2_nda
BEFORE INSERT OR UPDATE OF nda
ON Athlete_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_1@dbl_etupre
    WHERE nda = :NEW.nda;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'N° Athlete existant');
    END IF;
END;

------------Clé primaire pour Pratiquer
-------- Pratiquer_1 -----------
ALTER TABLE Pratiquer_1
ADD CONSTRAINT pk_pratiquer_1 PRIMARY KEY (nda, ndd);

CREATE OR REPLACE TRIGGER t_iu_pratiquer_1_nda_ndd
BEFORE INSERT OR UPDATE OF nda, ndd
ON Pratiquer_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n 
    FROM Pratiquer_2@dbl_etusec
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n 
    FROM Pratiquer_3@dbl_etuter
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cet Athlete pratique deja cette Discipline');
    END IF;
END;

-------- Pratiquer_2 -----------  
ALTER TABLE Pratiquer_2
ADD CONSTRAINT pk_pratiquer_2 PRIMARY KEY (nda, ndd);

CREATE OR REPLACE TRIGGER t_iu_pratiquer_2_nda_ndd
BEFORE INSERT OR UPDATE OF nda, ndd
ON Pratiquer_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Pratiquer_1@dbl_etupre
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n 
    FROM Pratiquer_3@dbl_etuter
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cet Athlete pratique deja cette Discipline');
    END IF;
END;

-------- Pratiquer_3 ----------- 
ALTER TABLE Pratiquer_3
ADD CONSTRAINT pk_pratiquer_3 PRIMARY KEY (nda, ndd);

CREATE OR REPLACE TRIGGER t_iu_pratiquer_3_nda_ndd
BEFORE INSERT OR UPDATE OF nda, ndd
ON Pratiquer_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n
    FROM Pratiquer_1@dbl_etupre
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    SELECT COUNT(*) INTO n
    FROM Pratiquer_2@dbl_etusec
    WHERE nda = :NEW.nda
    AND ndd = :NEW.ndd;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cet Athlete pratique deja cette Discipline');
    END IF;
END;

------------Clé primaire pour Gagner_I
-------- Gagner_I_1 -----------
ALTER TABLE Gagner_I_1
ADD CONSTRAINT pk_gagner_i_1 PRIMARY KEY (ndd, nda);

CREATE OR REPLACE TRIGGER t_iu_gagner_i_1_ndd_nda
BEFORE INSERT OR UPDATE OF ndd, nda
ON Gagner_I_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n 
    FROM Gagner_I_2@dbl_etusec
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    SELECT COUNT(*) INTO n 
    FROM Gagner_I_3@dbl_etuter
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cette medaille de Discipline a été deja ganger par cet Athlete');
    END IF;
END;

-------- Gagner_I_2 -----------  
ALTER TABLE Gagner_I_2
ADD CONSTRAINT pk_gagner_i_2 PRIMARY KEY (ndd, nda);

CREATE OR REPLACE TRIGGER t_iu_gagner_i_2_ndd_nda
BEFORE INSERT OR UPDATE OF ndd, nda
ON Gagner_I_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n 
    FROM Gagner_I_1@dbl_etupre
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    SELECT COUNT(*) INTO n 
    FROM Gagner_I_3@dbl_etuter
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cette medaille de Discipline a été deja ganger par cet Athlete');
    END IF;
END;

-------- Gagner_I_3 -----------  
ALTER TABLE Gagner_I_3
ADD CONSTRAINT pk_gagner_i_3 PRIMARY KEY (ndd, nda);

CREATE OR REPLACE TRIGGER t_iu_gagner_i_3_ndd_nda
BEFORE INSERT OR UPDATE OF ndd, nda
ON Gagner_I_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n 
    FROM Gagner_I_1@dbl_etupre
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    SELECT COUNT(*) INTO n 
    FROM Gagner_I_2@dbl_etusec
    WHERE ndd = :NEW.ndd
    AND nda = :NEW.nda;

    IF(n > 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Cette medaille de Discipline a été deja ganger par cet Athlete');
    END IF;
END;

--------------Clé primaire pour Pays
ALTER TABLE Pays_3
ADD CONSTRAINT pk_pays_3 PRIMARY KEY (cio);

--------------Clé primaire pour Pays
ALTER TABLE Gagner_E_3
ADD CONSTRAINT pk_gagner_e_3 PRIMARY KEY (ndd, cio, medaille);