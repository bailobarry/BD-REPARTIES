CREATE OR REPLACE TRIGGER t_iud_athlete_2
AFTER INSERT OR UPDATE OR DELETE ON Athlete_2
FOR EACH ROW
BEGIN
  IF (INSERTING) THEN
      INSERT INTO Athlete_2@dbl_etupre 
      VALUES (:NEW.nda, :NEW.ncomplet, :NEW.taille, :NEW.poids, 
              :NEW.daten, :NEW.villen, :NEW.paysn, :NEW.cio);
  ELSIF (DELETING) THEN
      DELETE FROM Athlete_2@dbl_etupre
      WHERE nda = :OLD.nda;
  ELSIF (UPDATING) THEN
      UPDATE Athlete_2@dbl_etupre
      SET ncomplet = :NEW.ncomplet,
          taille = :NEW.taille,
          poids = :NEW.poids,
          daten = :NEW.daten,
          villen = :NEW.villen,
          paysn = :NEW.paysn,
          cio = :NEW.cio
      WHERE nda = :OLD.nda;
  END IF;
END;
/


INSERT INTO Athlete_2 
VALUES (1545880, 'KUMARI Deepika', 160, 55, 
        TO_DATE('13/06/94', 'DD/MM/YY'), 'RANCHI', 
        'INDIA', 'IND');


Update ATHLETE_2
SET ncomplet = 'Eylul Alptekin'
Where nda = 1545880;

SELECT *
FROM Athlete_2@dbl_etupre 
WHERE nda = 1545880;


SELECT *
FROM Athlete_2@dbl_etusec
WHERE nda = 1545880;

DELETE FROM ATHLETE_2
WHERE nda = 1545880;