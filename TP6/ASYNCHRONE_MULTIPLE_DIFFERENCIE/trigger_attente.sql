CREATE OR REPLACE TRIGGER TRIG_ATT
AFTER INSERT OR UPDATE OR DELETE
ON Athlete_2_maitre 
FOR EACH ROW 
DECLARE 
  R1 VARCHAR(300); 
  R2 VARCHAR(300); 
BEGIN 

  IF (INSERTING) THEN 
    R1 := 'INSERT INTO Athlete_2_cliche@dbl_etupre VALUES ('  
      || :NEW.NDA || ', '''  
      || :NEW.NCOMPLET || ''', '  
      || :NEW.TAILLE || ', '  
      || :NEW.POIDS || ', TO_DATE('''  
      || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), ''' 
      || :NEW.VILLEN || ''', '''  
      || :NEW.PAYSN || ''', '''  
      || :NEW.CIO || ''')'; 
    R2 := 'INSERT INTO Athlete_2_cliche@dbl_etuter VALUES ('  
      || :NEW.NDA || ', '''  
      || :NEW.NCOMPLET || ''', '  
      || :NEW.TAILLE || ', '  
      || :NEW.POIDS || ', TO_DATE('''  
      || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), ''' 
      || :NEW.VILLEN || ''', '''  
      || :NEW.PAYSN || ''', '''  
      || :NEW.CIO || ''')'; 
    INSERT INTO ATTENTE  
    VALUES (SEQ_ATTENTE.NEXTVAL, R1, R2, 0, 0);  

  ELSIF (DELETING) THEN 
    R1 := 'DELETE FROM Athlete_2_cliche@dbl_etupre WHERE NDA = ' || :OLD.NDA; 
    R2 := 'DELETE FROM Athlete_2_cliche@dbl_etuter WHERE NDA = ' || :OLD.NDA; 
    INSERT INTO ATTENTE  
    VALUES (SEQ_ATTENTE.NEXTVAL, R1, R2, 0, 0);  

  ELSIF (UPDATING) THEN 
    R1 := 'UPDATE Athlete_2_cliche@dbl_etupre SET '  
      || 'NCOMPLET = ''' || :NEW.NCOMPLET || ''', '  
      || 'TAILLE = ' || :NEW.TAILLE || ', '  
      || 'POIDS = ' || :NEW.POIDS || ', ' 
      || 'DATEN = TO_DATE(''' || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), '  
      || 'VILLEN = ''' || :NEW.VILLEN || ''', '  
      || 'PAYSN = ''' || :NEW.PAYSN || ''', '  
      || 'CIO = ''' || :NEW.CIO || ''' '  
      || 'WHERE NDA = ' || :OLD.NDA; 
    R2 := 'UPDATE Athlete_2_cliche@dbl_etuter SET '  
      || 'NCOMPLET = ''' || :NEW.NCOMPLET || ''', '  
      || 'TAILLE = ' || :NEW.TAILLE || ', '  
      || 'POIDS = ' || :NEW.POIDS || ', ' 
      || 'DATEN = TO_DATE(''' || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), '  
      || 'VILLEN = ''' || :NEW.VILLEN || ''', '  
      || 'PAYSN = ''' || :NEW.PAYSN || ''', '  
      || 'CIO = ''' || :NEW.CIO || ''' '  
      || 'WHERE NDA = ' || :OLD.NDA; 
    INSERT INTO ATTENTE  
    VALUES (SEQ_ATTENTE.NEXTVAL, R1, R2, 0, 0);  
  END IF; 
END;
/