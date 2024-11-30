CREATE OR REPLACE TRIGGER t_iud_Pratiquer
INSTEAD OF INSERT OR DELETE OR UPDATE
ON Pratiquer
FOR EACH ROW
DECLARE
    v_genred CHAR(1);
BEGIN
    SELECT genred INTO v_genred
    FROM Discipline
    WHERE ndd = :NEW.ndd;

    -- Gestion des INSERTIONS
    IF (INSERTING) THEN
        IF (v_genred = 'M') THEN
            INSERT INTO Pratiquer_1@dbl_etupre (nda, ndd)
            VALUES (:NEW.nda, :NEW.ndd);
        ELSIF (v_genred = 'W') THEN
            INSERT INTO Pratiquer_2@dbl_etusec (nda, ndd)
            VALUES (:NEW.nda, :NEW.ndd);
        ELSIF (v_genred IN ('X', 'O')) THEN
            INSERT INTO Pratiquer_3@dbl_etuter (nda, ndd)
            VALUES (:NEW.nda, :NEW.ndd);
        END IF;
    END IF;

    -- Gestion des SUPPRESSIONS
    IF (DELETING) THEN
        IF (v_genred = 'M') THEN
            DELETE FROM Pratiquer_1@dbl_etupre
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        ELSIF (v_genred = 'W') THEN
            DELETE FROM Pratiquer_2@dbl_etusec
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        ELSIF (v_genred IN ('X', 'O')) THEN
            DELETE FROM Pratiquer_3@dbl_etuter
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        END IF;
    END IF;

    -- Gestion des MISE A JOUR
    IF (UPDATING) THEN
        IF (v_genred = 'M') THEN
            UPDATE Pratiquer_1@dbl_etupre
            SET nda = :NEW.nda,
                ndd = :NEW.ndd
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        ELSIF (v_genred = 'W') THEN
            UPDATE Pratiquer_2@dbl_etusec
            SET nda = :NEW.nda,
                ndd = :NEW.ndd
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        ELSIF (v_genred IN ('X', 'O')) THEN
            UPDATE Pratiquer_3@dbl_etuter
            SET nda = :NEW.nda,
                ndd = :NEW.ndd
            WHERE nda = :OLD.nda AND ndd = :OLD.ndd;
        END IF;
    END IF;
END;
/
