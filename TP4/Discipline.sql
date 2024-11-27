CREATE OR REPLACE TRIGGER t_iud_Discipline
INSTEAD OF INSERT OR DELETE OR UPDATE
ON Discipline
FOR EACH ROW
BEGIN 
    IF (INSERTING) THEN
        IF(:NEW.genred='M') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred='W') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.genred, :NEW.cds);
        END IF;
    END IF;

    IF (DELETING) THEN
        IF(:NEW.genred='M') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred='W') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.genred, :NEW.cds);
        END IF;
    END IF;

    IF (UPDATING) THEN
        IF(:NEW.genred='M') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred='W') THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.cds);
        ELSIF(:NEW.genred IN ('X', 'O')) THEN
            INSERT INTO Discipline_1@dbl_etupre
            VALUES(:NEW.ndd, :NEW.nomd, :NEW.typed, :NEW.genred, :NEW.cds);
        END IF;
    END IF;
END
