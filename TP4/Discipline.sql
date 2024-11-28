CREATE OR REPLACE TRIGGER t_iud_Discipline
INSTEAD OF INSERT OR DELETE OR UPDATE
ON Discipline
FOR EACH ROW
BEGIN 
    -- Insertion des données dans la vue
    IF (INSERTING) THEN
        IF(:NEW.genred='M') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred='W') THEN
            INSERT INTO Discipline_2@dbl_etusec
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            INSERT INTO Discipline_3@dbl_etuter
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.genred, :NEW.cds);
        END IF;
    END IF;

    -- Suppresion des données de la vue
    IF (DELETING) THEN
        IF(:NEW.genred='M') THEN
            DELETE FROM Discipline_1@dbl_etupre
            WHERE ndd = :OLD.ndd;
        ELSIF(:NEW.genred='W') THEN
            DELETE FROM Discipline_2@dbl_etusec
            WHERE ndd = :OLD.ndd;
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            DELETE FROM Discipline_3@dbl_etuter
            WHERE ndd = :OLD.ndd;
        END IF;
    END IF;

    -- Mise à jour des données dans la vue
    IF (UPDATING) THEN
        IF(:NEW.genred='M') THEN
            UPDATE Discipline_1@dbl_etupre
            SET ndd = :NEW.ndd,
                nomd = :NEW.nomd,
                typed = :NEW.typed,
                cds = :NEW.cds
            WHERE ndd = :OLD.ndd;
        ELSIF(:NEW.genred='W') THEN
            UPDATE Discipline_2@dbl_etusec
            SET ndd = :NEW.ndd,
                nomd = :NEW.nomd,
                typed = :NEW.typed,
                cds = :NEW.cds
            WHERE ndd = :OLD.ndd;
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            UPDATE Discipline_3@dbl_etuter
            SET ndd = :NEW.ndd,
                nomd = :NEW.nomd,
                typed = :NEW.typed,
                cds = :NEW.cds
            WHERE ndd = :OLD.ndd;
        END IF;
    END IF;
END;
/

SET SERVEROUTPUT ON;
EXEC Gest_JO.AjouterDiscipline('Sauter très haut', 'P', 'M', 'ATH');
