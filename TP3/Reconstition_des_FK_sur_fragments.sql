-------------------------- CLES ETRANGERES ------------------------
-------------- Sur les fragments de Discipline---------------
--------------Discipline_1 et Sport_1
ALTER TABLE Discipline_1
ADD CONSTRAINT fk_discipline_1_sport_1 FOREIGN KEY (cds) REFERENCES Sport_1 (cds);

--------------Discipline_2 et Sport_2
ALTER TABLE Discipline_2
ADD CONSTRAINT fk_discipline_2_sport_2 FOREIGN KEY (cds) REFERENCES Sport_2 (cds);

--------TRIGGER 'iu' Discipline_3 et Sport_1----------
CREATE OR REPLACE TRIGGER t_iu_discipline_3_cds
BEFORE INSERT OR UPDATE OF cds 
ON Discipline_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Sport_1@dbl_etupre
    WHERE cds = :NEW.cds;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'cds inexistant dans Sport_1');
    END IF;
END;

--------TRIGGER 'du' Sport_1 et Discipline_3----------
CREATE OR REPLACE TRIGGER t_du_sport_1_cds
BEFORE DELETE OR UPDATE OF cds 
ON Sport_1
FOR EACH ROW
DECLARE 
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Discipline_3@dbl_etuter
    WHERE cds = :OLD.cds;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'cds existant dans Discipline_3');
    END IF;
END;

--------------Sur les fragments de Athlete---------------
--------TRIGGER 'iu' Athlete_1 et Pays_3----------
CREATE OR REPLACE TRIGGER t_iu_athlete_1_cio
BEFORE INSERT OR UPDATE OF cio 
ON Athlete_1
FOR EACH ROW
DECLARE 
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Pays_3@dbl_etuter
    WHERE cio = :NEW.cio;

    IF(n = 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'cio inexistant das Pays_3');
    END IF;
END;

--------TRIGGER 'iu' Athlete_2 et Pays_3----------
CREATE OR REPLACE TRIGGER t_iu_athlete_2_cio
BEFORE INSERT OR UPDATE OF cio 
ON Athlete_2
FOR EACH ROW
DECLARE 
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Pays_3@dbl_etuter
    WHERE cio = :NEW.cio;

    IF(n = 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'cio inexistant das Pays_3');
    END IF;
END;

--------TRIGGER 'du' Pays_3 et Athlete_1----------
CREATE OR REPLACE TRIGGER t_du_pays_3_athelete_1_cio
BEFORE DELETE OR UPDATE OF cio 
ON Pays_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_1@dbl_etupre
    WHERE cio = :OLD.cio;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'cio existant dans Athlete_1');
    END IF;
END;

--------TRIGGER 'du' Pays_3 et Athlete_2----------
CREATE OR REPLACE TRIGGER t_du_pays_3_athlete_2_cio
BEFORE DELETE OR UPDATE OF cio 
ON Pays_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_2@dbl_etusec
    WHERE cio = :OLD.cio;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'cio existant dans Athlete_2');
    END IF;
END;

--------------Sur les fragments de Pratiquer---------------
--------------Pratiquer_1 et Athlete_1
ALTER TABLE Pratiquer_1
ADD CONSTRAINT fk_pratiquer_1_nda FOREIGN KEY (nda) REFERENCES Athlete_1 (nda);

--------------Pratiquer_2 et Athlete_2
ALTER TABLE Pratiquer_2
ADD CONSTRAINT fk_pratiquer_2_nda FOREIGN KEY (nda) REFERENCES Athlete_2 (nda);

--------------Pratiquer_1 et Discipline_1
ALTER TABLE Pratiquer_1
ADD CONSTRAINT fk_pratiquer_1_ndd FOREIGN KEY (ndd) REFERENCES Discipline_1 (ndd);

--------------Pratiquer_2 et Discipline_2
ALTER TABLE Pratiquer_2
ADD CONSTRAINT fk_pratiquer_2_ndd FOREIGN KEY (ndd) REFERENCES Discipline_2 (ndd);

--------------Pratiquer_3 et Discipline_3
ALTER TABLE Pratiquer_3
ADD CONSTRAINT fk_pratiquer_3_ndd FOREIGN KEY (ndd) REFERENCES Discipline_3 (ndd);

--------TRIGGER 'iu' Pratiquer_3 et Athlete_1----------
CREATE OR REPLACE TRIGGER t_iu_pratiquer_3_athlete_1_nda
BEFORE INSERT OR UPDATE OF nda
ON Pratiquer_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_1@dbl_etupre
    WHERE nda = :NEW.nda;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'nda inexistant dans Athlete_1');
    END IF;
END;

--------TRIGGER 'iu' Pratiquer_3 et Athlete_2----------
CREATE OR REPLACE TRIGGER t_iu_pratiquer_3_athlete_2_nda
BEFORE INSERT OR UPDATE OF nda
ON Pratiquer_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_2@dbl_etusec
    WHERE nda = :NEW.nda;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'nda inexistant dans Athlete_2');
    END IF;
END;

--------TRIGGER 'du' Athlete_1 et Pratiquer_3----------
CREATE OR REPLACE TRIGGER t_du_ath_1_prat_3_nda
BEFORE DELETE OR UPDATE OF nda 
ON Athlete_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Pratiquer_3@dbl_etuter
    WHERE nda = :OLD.nda;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Pratiquer_3');
    END IF;
END;

--------TRIGGER 'du' Athlete_2 et Pratiquer_3----------
CREATE OR REPLACE TRIGGER t_du_ath_2_prat_3_nda
BEFORE DELETE OR UPDATE OF nda 
ON Athlete_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Pratiquer_3@dbl_etuter
    WHERE nda = :OLD.nda;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Pratiquer_3');
    END IF;
END;

--------------Sur les fragments de Gagner_I---------------
--------------Gagner_I_1 et Discipline_1
ALTER TABLE Gagner_I_1
ADD CONSTRAINT fk_gagner_i_1_ndd FOREIGN KEY (ndd) REFERENCES Discipline_1 (ndd);

--------------Gagner_I_2 et Discipline_2
ALTER TABLE Gagner_I_2
ADD CONSTRAINT fk_gagner_i_2_ndd FOREIGN KEY (ndd) REFERENCES Discipline_2 (ndd);

--------------Gagner_I_3 et Discipline_3
ALTER TABLE Gagner_I_3
ADD CONSTRAINT fk_gagner_i_3_ndd FOREIGN KEY (ndd) REFERENCES Discipline_3 (ndd);

--------------Gagner_I_1 et Athlete_1
ALTER TABLE Gagner_I_1
ADD CONSTRAINT fk_gagner_i_1_nda FOREIGN KEY (nda) REFERENCES Athlete_1 (nda);

--------------Gagner_I_2 et Athlete_2
ALTER TABLE Gagner_I_2
ADD CONSTRAINT fk_gagner_i_2_nda FOREIGN KEY (nda) REFERENCES Athlete_2 (nda);

--------TRIGGER 'iu' Gagner_I_3 et Athlete_1----------
CREATE OR REPLACE TRIGGER t_iu_gagner_i_3_athlete_1_nda
BEFORE INSERT OR UPDATE OF nda
ON Gagner_I_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_1@dbl_etupre
    WHERE nda = :NEW.nda;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'nda inexistant dans Athlete_1');
    END IF;
END;

--------TRIGGER 'iu' Gagner_I_3 et Athlete_2----------
CREATE OR REPLACE TRIGGER t_iu_gagner_i_3_athlete_2_nda
BEFORE INSERT OR UPDATE OF nda
ON Gagner_I_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Athlete_2@dbl_etusec
    WHERE nda = :NEW.nda;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'nda inexistant dans Athlete_2');
    END IF;
END;

--------TRIGGER 'du' Athlete_1 et Gagner_I_3----------
CREATE OR REPLACE TRIGGER t_du_athelete_1_gagner_i_3_nda
BEFORE DELETE OR UPDATE OF nda 
ON Athlete_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Gagner_I_3@dbl_etuter
    WHERE nda = :OLD.nda;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Gagner_I_3');
    END IF;
END;

--------TRIGGER 'du' Athlete_2 et Gagner_I_3----------
CREATE OR REPLACE TRIGGER t_du_athelete_2_gagner_i_3_nda
BEFORE DELETE OR UPDATE OF nda 
ON Athlete_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Gagner_I_3@dbl_etuter
    WHERE nda = :OLD.nda;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Gagner_I_3');
    END IF;
END;

--------------Sur les fragments de Gagner_E---------------
--------------Gagner_E_3 et Pays_3
ALTER TABLE Gagner_E_3
ADD CONSTRAINT fk_gagner_e_3_cio FOREIGN KEY (cio) REFERENCES Pays_3 (cio);

--------TRIGGER 'iu' Gagner_E_3 et Discipline----------
CREATE OR REPLACE TRIGGER t_iu_gagner_e_3_discipline_ndd
BEFORE INSERT OR UPDATE OF ndd
ON Gagner_E_3
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

    SELECT COUNT(*) INTO n 
    FROM Discipline_3@dbl_etuter
    WHERE ndd = :NEW.ndd;

    IF(n = 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'nda inexistant dans Discipline_1');
    END IF;
END;


--------TRIGGER 'du' Discipline_1 et Gagner_E_3----------
CREATE OR REPLACE TRIGGER t_du_discip_1_gagner_e_3_ndd
BEFORE DELETE OR UPDATE OF ndd
ON Discipline_1
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Gagner_E_3@dbl_etuter
    WHERE ndd = :OLD.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Gagner_E_3');
    END IF;
END;

--------TRIGGER 'du' Discipline_2 et Gagner_E_3----------
CREATE OR REPLACE TRIGGER t_du_discip_2_gagner_e_3_ndd
BEFORE DELETE OR UPDATE OF ndd
ON Discipline_2
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Gagner_E_3@dbl_etuter
    WHERE ndd = :OLD.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Gagner_E_3');
    END IF;
END;

--------TRIGGER 'du' Discipline_3 et Gagner_E_3----------
CREATE OR REPLACE TRIGGER t_du_discip_3_gagner_e_3_ndd
BEFORE DELETE OR UPDATE OF ndd
ON Discipline_3
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN 
    SELECT COUNT(*) INTO n 
    FROM Gagner_E_3@dbl_etuter
    WHERE ndd = :OLD.ndd;

    IF(n > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'nda existant dans Gagner_E_3');
    END IF;
END;