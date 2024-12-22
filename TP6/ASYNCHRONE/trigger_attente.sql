CREATE OR REPLACE TRIGGER t_iud_attente 
AFTER INSERT OR UPDATE OR DELETE 
ON Athlete_2_maitre
FOR EACH ROW
DECLARE
    requete VARCHAR(300);
BEGIN 
    IF(INSERTING) THEN
        requete := 'INSERT INTO Athlete_2_cliche@dbl_etupre '
            || 'VALUES ('
            ||          :NEW.nda ||', '''
            ||          :NEW.ncomplet ||', '''
            ||          :NEW.taille ||', '''
            ||          :NEW.poids ||', '''
            ||          :NEW.daten ||', '''
            ||          :NEW.villen ||', '''
            ||          :NEW.paysn ||', '''
            ||          :NEW.cio ||''')';
        INSERT INTO Attente 
        VALUES (seq_attente.NEXTVAL, requete);
    ELSIF(DELETING) THEN
        requete := 'DELETE FROM Athlete_2_cliche@dbl_etupre '
            || 'WHERE nda = ' || :OLD.nda;
        INSERT INTO Attente 
        VALUES (seq_attente.NEXTVAL, requete);            
    ELSIF(UPDATING) THEN
        requete := 'UPDATE Athlete_2_cliche@dbl_etupre '
            || 'SET ncomplet = ''' || :NEW.ncomplet || ''', '
            || 'taille = ''' || :NEW.taille || ''', '
            || 'poids = ''' || :NEW.poids || ''', '
            || 'daten = ''' || :NEW.daten || ''', '
            || 'villen = ''' || :NEW.villen || ''', '
            || 'paysn = ''' || :NEW.paysn || ''', '
            || 'cio = ''' || :NEW.cio || ''' '
            || 'WHERE nda = ' || :OLD.nda;
        INSERT INTO Attente  
        VALUES (seq_attente.NEXTVAL, requete);
    END IF;
END;



CREATE OR REPLACE TRIGGER t_iud_athlete_2_maitre
AFTER INSERT OR UPDATE OR DELETE
ON Athlete_2_maitre
FOR EACH ROW
DECLARE
    R VARCHAR(300);
BEGIN
    IF (INSERTING) THEN
        R := 'INSERT INTO Athlete_2_cliche@dbl_etupre VALUES (' 
             || :NEW.NDA || ', ''' 
             || :NEW.NCOMPLET || ''', ' 
             || :NEW.TAILLE || ', ' 
             || :NEW.POIDS || ', TO_DATE(''' 
             || TO_CHAR(:NEW.DATEN,'DD/MM/YY') || ''', ''DD/MM/YY''), '''
             || :NEW.VILLEN || ''', ''' 
             || :NEW.PAYSN || ''', ''' 
             || :NEW.CIO || ''')';
        INSERT INTO ATTENTE 
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    ELSIF (DELETING) THEN
        R := 'DELETE FROM Athlete_2_cliche@dbl_etupre WHERE NDA = ' || :OLD.NDA;
        INSERT INTO ATTENTE 
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    ELSIF (UPDATING) THEN
        R := 'UPDATE Athlete_2_cliche@dbl_etupre SET ' 
             || 'NCOMPLET = ''' || :NEW.NCOMPLET || ''', ' 
             || 'TAILLE = ' || :NEW.TAILLE || ', ' 
             || 'POIDS = ' || :NEW.POIDS || ', '
             || 'DATEN = TO_DATE(''' || TO_CHAR(:NEW.DATEN, 'DD/MM/YY') || ''', ''DD/MM/YY''), ' 
             || 'VILLEN = ''' || :NEW.VILLEN || ''', ' 
             || 'PAYSN = ''' || :NEW.PAYSN || ''', ' 
             || 'CIO = ''' || :NEW.CIO || ''' ' 
             || 'WHERE NDA = ' || :OLD.NDA;
        INSERT INTO ATTENTE  
        VALUES (SEQ_ATTENTE.NEXTVAL, R);
    END IF;
END;
/
