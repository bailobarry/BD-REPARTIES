CREATE OR REPLACE TRIGGER t_iu_Discipline
INSTEAD OF INSERT
ON Discipline
FOR EACH ROW
BEGIN 
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
END

CREATE OR REPLACE TRIGGER t_du_Discipline
INSTEAD OF DELETE
ON Discipline
FOR EACH ROW
BEGIN 
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
END

CREATE OR REPLACE TRIGGER t_up_Discipline
INSTEAD OF UPDATE
ON Discipline
FOR EACH ROW
BEGIN 
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
END