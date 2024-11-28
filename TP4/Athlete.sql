CREATE OR REPLACE TRIGGER t_iud_Athlete_V
INSTEAD OF INSERT OR DELETE OR UPDATE
ON Athlete_V
FOR EACH ROW
BEGIN
    -- Gestion des INSERTIONS
    IF (INSERTING) THEN
        -- Redirection vers le fragment correspondant
        IF (:NEW.genre = 'M') THEN
            INSERT INTO Athlete_1@dbl_etupre
            VALUES (:NEW.nda, :NEW.ncomplet, :NEW.taille, :NEW.poids, :NEW.daten, :NEW.villen, :NEW.paysn, :NEW.cio);
        ELSIF (:NEW.genre = 'F') THEN
            INSERT INTO Athlete_2@dbl_etusec
            VALUES (:NEW.nda, :NEW.ncomplet, :NEW.taille, :NEW.poids, :NEW.daten, :NEW.villen, :NEW.paysn, :NEW.cio);
        END IF;
    END IF;

    -- Gestion des SUPPRESSIONS
    IF (DELETING) THEN
        -- Suppression dans le fragment correspondant
        IF (:OLD.genre = 'M') THEN
            DELETE FROM Athlete_1@dbl_etupre 
            WHERE nda = :OLD.nda;
        ELSIF (:OLD.genre = 'F') THEN
            DELETE FROM Athlete_2@dbl_etusec 
            WHERE nda = :OLD.nda;
        END IF;
    END IF;

    -- Gestion des MISES À JOUR
    IF (UPDATING) THEN
        IF (:NEW.genre = 'M') THEN
            UPDATE Athlete_1@dbl_etupre
            SET nda = :NEW.nda,
                ncomplet = :NEW.ncomplet,
                taille = :NEW.taille,
                poids = :NEW.poids,
                daten = :NEW.daten,
                villen = :NEW.villen,
                paysn = :NEW.paysn,
                cio = :NEW.cio
            WHERE nda = :OLD.nda;
        ELSIF (:NEW.genre = 'F') THEN
            UPDATE Athlete_2@dbl_etusec
            SET nda = :NEW.nda,
                ncomplet = :NEW.ncomplet,
                taille = :NEW.taille,
                poids = :NEW.poids,
                daten = :NEW.daten,
                villen = :NEW.villen,
                paysn = :NEW.paysn,
                cio = :NEW.cio
            WHERE nda = :OLD.nda;
        END IF;
    END IF;
END;
/
